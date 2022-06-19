using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace EHealthCare_API.Migrations
{
    public partial class Added_Orders_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Orders",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserEmailId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Address = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OrderProductId = table.Column<int>(type: "int", nullable: false),
                    OrderProductName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OrderProductPrice = table.Column<double>(type: "float", nullable: false),
                    OrderProductImage = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    OrderProductQuantity = table.Column<int>(type: "int", nullable: false),
                    OrderProductDateTime = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Orders", x => x.ID);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Orders");
        }
    }
}
