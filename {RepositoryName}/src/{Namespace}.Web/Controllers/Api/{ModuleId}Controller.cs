using {Namespace}.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;


namespace {Namespace}.Web.Controllers.Api
{
    [Route("api/{ModuleId}")]
    public class {ModuleID}Controller : Controller
    {
        // GET: api/{Namespace}
        [HttpGet]
        [Route("")]
        [Authorize(ModuleConstants.Security.Permissions.Read)]
        public ActionResult<string> Get()
        {
            return Ok(new { result = "Hello world!" });
        }
    }
}
