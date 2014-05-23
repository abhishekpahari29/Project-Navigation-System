package com.fiftyhertz.pns.web;
import com.fiftyhertz.pns.domain.PackageDetails;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RooWebJson(jsonObject = PackageDetails.class)
@Controller
@RequestMapping("/packagedetailses")
@RooWebScaffold(path = "packagedetailses", formBackingObject = PackageDetails.class)
@RooWebFinder
public class PackageDetailsController {
}
