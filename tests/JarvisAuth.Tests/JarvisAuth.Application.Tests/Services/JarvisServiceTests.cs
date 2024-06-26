﻿using AutoMapper;
using JarvisAuth.Application.Services;
using JarvisAuth.Core.Requests.Jarvis;
using JarvisAuth.Core.Responses.Jarvis;
using JarvisAuth.Core.Responses.Shared;
using JarvisAuth.Domain.Interfaces.Repositories;
using Microsoft.Extensions.Configuration;
using Moq;

namespace JarvisAuth.Tests.JarvisAuth.Application.Tests.Services
{
    public class JarvisServiceTests
    {
        private readonly Mock<IConfiguration> _configurationMock;
        private readonly Mock<IJarvisRepository> _jarvisRepositoryMock;
        private readonly Mock<IMapper> _mapperMock;
        private readonly JarvisService _jarvisService;

        public JarvisServiceTests()
        {
            _jarvisRepositoryMock = new Mock<IJarvisRepository>();
            _mapperMock = new Mock<IMapper>();
            _jarvisService = new JarvisService(_configurationMock.Object, _jarvisRepositoryMock.Object, _mapperMock.Object);
        }

        [Fact]
        public async Task PostCreateUserJarvis_ReturnsError_WhenEmailExists()
        {
            // Arrange
            var request = new PostCreateUserJarvisRequest
            {
                Name = "John Doe",
                Email = "test@example.com",
                Password = "password123"
            };

            var response = new Response<PostCreateUserJarvisResponse>();

            _jarvisRepositoryMock.Setup(repo => repo.EmailExistsAsync(request.Email)).ReturnsAsync(true);

            // Act
            var result = await _jarvisService.PostCreateUserJarvis(request);

            // Assert
            Assert.NotNull(result.Errors);
            Assert.Contains("Email already exists", result.Errors);
            Assert.Equal(409, result.StatusCode);
        }

    }
}
