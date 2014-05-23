// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.web;

import com.fiftyhertz.pns.domain.ClassDetails;
import com.fiftyhertz.pns.domain.MethodDetail;
import com.fiftyhertz.pns.domain.VariableDetails;
import com.fiftyhertz.pns.web.VariableDetailsController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect VariableDetailsController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String VariableDetailsController.create(@Valid VariableDetails variableDetails, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, variableDetails);
            return "variabledetailses/create";
        }
        uiModel.asMap().clear();
        variableDetails.persist();
        return "redirect:/variabledetailses/" + encodeUrlPathSegment(variableDetails.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String VariableDetailsController.createForm(Model uiModel) {
        populateEditForm(uiModel, new VariableDetails());
        return "variabledetailses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String VariableDetailsController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("variabledetails", VariableDetails.findVariableDetails(id));
        uiModel.addAttribute("itemId", id);
        return "variabledetailses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String VariableDetailsController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("variabledetailses", VariableDetails.findVariableDetailsEntries(firstResult, sizeNo));
            float nrOfPages = (float) VariableDetails.countVariableDetailses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("variabledetailses", VariableDetails.findAllVariableDetailses());
        }
        return "variabledetailses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String VariableDetailsController.update(@Valid VariableDetails variableDetails, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, variableDetails);
            return "variabledetailses/update";
        }
        uiModel.asMap().clear();
        variableDetails.merge();
        return "redirect:/variabledetailses/" + encodeUrlPathSegment(variableDetails.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String VariableDetailsController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, VariableDetails.findVariableDetails(id));
        return "variabledetailses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String VariableDetailsController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        VariableDetails variableDetails = VariableDetails.findVariableDetails(id);
        variableDetails.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/variabledetailses";
    }
    
    void VariableDetailsController.populateEditForm(Model uiModel, VariableDetails variableDetails) {
        uiModel.addAttribute("variableDetails", variableDetails);
        uiModel.addAttribute("classdetailses", ClassDetails.findAllClassDetailses());
        uiModel.addAttribute("methoddetails", MethodDetail.findAllMethodDetails());
    }
    
    String VariableDetailsController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}