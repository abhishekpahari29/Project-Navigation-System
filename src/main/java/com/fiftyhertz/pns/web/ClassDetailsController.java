package com.fiftyhertz.pns.web;
import com.fiftyhertz.pns.domain.ClassDetails;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RooWebJson(jsonObject = ClassDetails.class)
@Controller
@RequestMapping("/classdetailses")
@RooWebScaffold(path = "classdetailses", formBackingObject = ClassDetails.class)
@RooWebFinder
public class ClassDetailsController {
}
