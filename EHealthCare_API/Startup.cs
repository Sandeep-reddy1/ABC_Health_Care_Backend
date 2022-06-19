using EHealthCare_API.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EHealthCare_API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "EHealthCare_API", Version = "v1" });
            });
            /* services.AddDbContext<MedicineStoreDbContext>(dbContextOptionBuilder =>
            dbContextOptionBuilder.UseSqlServer("Server=BSC-PG02TQPS\\SQLEXPRESS;Database=MedicineStoreDatabase;Trusted_Connection=True;MultipleActiveResultSets=true"));*/
            services.AddDbContext<MedicineStoreDbContext>(DbContextOptionsBuilder =>
            DbContextOptionsBuilder.UseSqlServer("Data Source = tcp: ehealthcare-apidbserver.database.windows.net, 1433; Initial Catalog = EHealthCare_API_db; Persist Security Info = False; User Id = akshetty@ehealthcare - apidbserver; Password = admin@1234; MultipleActiveResultSets = False; Encrypt = True; TrustServerCertificate = False; Connection Timeout = 30;"));
            //Enable Cors
            services.AddCors(c =>
            {
                c.AddPolicy("AllowOrigin", options => options.AllowAnyOrigin().AllowAnyMethod()
                 .AllowAnyHeader());
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseCors(options => options.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "EHealthCare_API v1"));
            }

            app.UseRouting();
           // app.UseHsts();
           // app.UseHttpsRedirection();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
