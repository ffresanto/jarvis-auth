﻿using JarvisAuth.Domain.Entities;
using JarvisAuth.Domain.models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace JarvisAuth.Infrastructure.Mappings.JarvisMapping
{
    public class UserJarvisMapping : IEntityTypeConfiguration<UserJarvis>
    {
        public void Configure(EntityTypeBuilder<UserJarvis> builder)
        {
            builder.ToTable("users_jarvis");

            builder.HasKey(u => u.Id);

            builder.Property(u => u.Id)
                .HasColumnName("id")
                .IsRequired();

            builder.Property(u => u.Name)
                .HasColumnName("name")
                .IsRequired();

            builder.Property(u => u.Password)
                .HasColumnName("password")
                .IsRequired();

            builder.Property(u => u.Email)
                .HasColumnName("email")
                .IsRequired();

            builder.Property(u => u.ContactNumber)
                .HasColumnName("contact_number");

            builder.Property(u => u.GenderTypeId)
                .HasColumnName("gender_type_id")
                .IsRequired();

            builder.Property(u => u.DocumentTypeId)
                .HasColumnName("document_type_id")
                .IsRequired();

            builder.Property(u => u.DocumentNumber)
                .HasColumnName("number_document")
                .IsRequired();

            builder.Property(u => u.CreatedAt)
                .HasColumnName("created_at")
                .IsRequired();

            builder.Property(u => u.UpdatedAt)
                .HasColumnName("update_at")
                .IsRequired();

            builder.Property(u => u.UserJarvisRoleId)
                .HasColumnName("user_jarvis_role_id")
                .HasDefaultValue(1)
                .IsRequired();

            builder.Property(u => u.Enabled)
                .HasColumnName("enabled")
                .HasDefaultValue(false)
                .IsRequired();
        }
    }
}