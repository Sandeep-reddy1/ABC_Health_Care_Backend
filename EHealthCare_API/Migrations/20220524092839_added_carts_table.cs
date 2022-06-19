using Microsoft.EntityFrameworkCore.Migrations;

namespace EHealthCare_API.Migrations
{
    public partial class added_carts_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Carts",
                columns: table => new
                {
                    ID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserEmailId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CartProuctId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CartProductName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CartProductPrice = table.Column<double>(type: "float", nullable: false),
                    CartProductImage = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CartProductQuantity = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Carts", x => x.ID);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Carts");
        }
    }
}
