package com.fiftyhertz.pns.web;
import com.fiftyhertz.pns.domain.MethodDetail;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.roo.addon.web.mvc.controller.finder.RooWebFinder;

@RooWebJson(jsonObject = MethodDetail.class)
@Controller
@RequestMapping("/methoddetails")
@RooWebScaffold(path = "methoddetails", formBackingObject = MethodDetail.class)
@RooWebFinder
public class MethodDetailController {
}
