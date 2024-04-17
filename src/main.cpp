/*
 *  Copyright (c) 2020 Jeremy HU <jeremy-at-dust3d dot org>. All rights reserved. 
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:

 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.

 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */
#include "quadmeshgenerator.h"
#include "fstream"
#include "iostream"
#include "memory"
#include "vector"

struct Input {
	/** The vertices of the mesh. [[x0,y0,z0],... [xn,yn,zn]] */
	std::vector<std::vector<double>> vertices;
	/** The triangles of the mesh. [[v0,v1,v2],... [vn-2,vn-1,vn]] */
	std::vector<std::vector<size_t>> triangles;
};

int main(int argc, char **argv) {
	// Input and output file paths.
	std::string argInputFilePath = "input.bin";
	std::string argOutputFilePath = "output.bin";
	double argScaling = 0.0;
	size_t argTargetTriangleNumber = 0;
	bool argOrganicModel = false;

	// Parse arguments to get -i and -o file paths.
	for (int i = 1; i < argc; i++) {
		if (std::string(argv[i]) == "-i") {
			if (i + 1 < argc) {
				argInputFilePath = argv[i + 1];
				i++;
			}
		} else if (std::string(argv[i]) == "-o") {
			if (i + 1 < argc) {
				argOutputFilePath = argv[i + 1];
				i++;
			}
		} else if (std::string(argv[i]) == "-s") {
			if (i + 1 < argc) {
				argScaling = std::stod(argv[i + 1]);
				i++;
			}
		} else if (std::string(argv[i]) == "-t") {
			if (i + 1 < argc) {
				argTargetTriangleNumber = std::stoul(argv[i + 1]);
				i++;
			}
		} else if (std::string(argv[i]) == "-m") {
			argOrganicModel = true;
		}
	}

	// Read input
	Input input;
	std::ifstream inputFileStream(argInputFilePath, std::ios::binary);
	if (!inputFileStream.is_open()) {
		std::cerr << "Failed to open input file: " << argInputFilePath << std::endl;
		return 1;
	}

	// Read vertices number.
	size_t verticesNumber = 0;
	inputFileStream.read((char *) &verticesNumber, sizeof(size_t));

	// Reserve memory for vertices.
	input.vertices.resize(verticesNumber);

	// Read vertices.
	for (size_t i = 0; i < verticesNumber; i++) {
		// Reserve memory for vertex.
		size_t vertexSize = 3 * sizeof(double);
		input.vertices[i].resize(vertexSize);

		// Read vertex.
		inputFileStream.read((char *) input.vertices[i].data(), (std::streamsize) vertexSize);
	}

	// Read triangles number.
	size_t trianglesNumber = 0;
	inputFileStream.read((char *) &trianglesNumber, sizeof(size_t));

	// Reserve memory for triangles.
	input.triangles.resize(trianglesNumber);

	// Read triangles.
	for (size_t i = 0; i < trianglesNumber; i++) {
		// Reserve memory for triangle.
		size_t triangleSize = 3 * sizeof(size_t);
		input.triangles[i].resize(triangleSize);

		// Read triangle.
		inputFileStream.read((char *) input.triangles[i].data(), (std::streamsize) triangleSize);
	}

	// Prepare parameters.
	QuadMeshGenerator::Parameters parameters;
	parameters.scaling = argScaling;
	parameters.targetTriangleCount = argTargetTriangleNumber;
	parameters.modelType = argOrganicModel ? AutoRemesher::ModelType::Organic : AutoRemesher::ModelType::HardSurface;

	// Prepare vertices and triangles.
	std::vector<AutoRemesher::Vector3> vertices;
	std::vector<std::vector<size_t>> triangles;
	for (const auto &vertex: input.vertices) {
		vertices.emplace_back(vertex[0], vertex[1], vertex[2]);
	}
	for (const auto &triangle: input.triangles) {
		triangles.emplace_back(triangle);
	}

	// Generate quad mesh.
	QuadMeshGenerator quadMeshGenerator(vertices, triangles);
	quadMeshGenerator.setParameters(parameters);
	quadMeshGenerator.generate();

	// Remeshed vertices.
	std::unique_ptr<std::vector<AutoRemesher::Vector3>> remeshedVertices;
	remeshedVertices.reset(quadMeshGenerator.takeRemeshedVertices());
	if (remeshedVertices == nullptr) {
		std::cerr << "Failed to get remeshed vertices." << std::endl;
		return 1;
	}

	// Remeshed quads.
	std::unique_ptr<std::vector<std::vector<size_t>>> remeshedQuads;
	remeshedQuads.reset(quadMeshGenerator.takeRemeshedQuads());
	if (remeshedQuads == nullptr) {
		std::cerr << "Failed to get remeshed quads." << std::endl;
		return 1;
	}

	// Write output
	std::ofstream outputFileStream(argOutputFilePath, std::ios::binary);
	if (!outputFileStream.is_open()) {
		std::cerr << "Failed to open output file: " << argOutputFilePath << std::endl;
		return 1;
	}

	// Write vertices number.
	verticesNumber = remeshedVertices->size();
	outputFileStream.write((char *) &verticesNumber, sizeof(size_t));

	// Write vertices.
	for (size_t i = 0; i < verticesNumber; i++) {
		// Write vertex.
		outputFileStream.write((char *) &(*remeshedVertices)[i].x(), sizeof(double));
		outputFileStream.write((char *) &(*remeshedVertices)[i].y(), sizeof(double));
		outputFileStream.write((char *) &(*remeshedVertices)[i].z(), sizeof(double));
	}

	// Write quads number.
	trianglesNumber = remeshedQuads->size();

	// Write quads.
	for (size_t i = 0; i < trianglesNumber; i++) {
		// Write quad.
		outputFileStream.write((char *) &(*remeshedQuads)[i][0], sizeof(size_t));
		outputFileStream.write((char *) &(*remeshedQuads)[i][1], sizeof(size_t));
		outputFileStream.write((char *) &(*remeshedQuads)[i][2], sizeof(size_t));
		outputFileStream.write((char *) &(*remeshedQuads)[i][3], sizeof(size_t));
	}

	return 0;
}
