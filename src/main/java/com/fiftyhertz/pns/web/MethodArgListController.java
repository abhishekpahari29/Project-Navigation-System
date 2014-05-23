package com.fiftyhertz.pns.web;
import com.fiftyhertz.pns.domain.MethodArgList;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RooWebJson(jsonObject = MethodArgList.class)
@Controller
@RequestMapping("/methodarglists")
@RooWebScaffold(path = "methodarglists", formBackingObject = MethodArgList.class)
@RooWebFinder
public class MethodArgListController {
}
