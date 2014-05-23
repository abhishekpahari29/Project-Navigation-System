package com.fiftyhertz.pns.web;
import com.fiftyhertz.pns.domain.VariableDetails;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = VariableDetails.class)
@Controller
@RequestMapping("/variabledetailses")
@RooWebScaffold(path = "variabledetailses", formBackingObject = VariableDetails.class)
public class VariableDetailsController {
}
