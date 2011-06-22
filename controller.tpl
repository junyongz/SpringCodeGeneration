package com.converscient.sms.portlet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.MessageCodesResolver;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.converscient.sms.${class_name};
import com.converscient.sms.hibernate.EntityRepository;

@Controller
@RequestMapping(value = "view", params = "path=/${$item.camelize(class_name)}/commands")
public class ${class_name}Controller {

	@Autowired
	private MessageCodesResolver messageCodesResolver;

	@InitBinder("${$item.camelize(class_name)}")
	public void initWebBinder(WebDataBinder binder) {
		//binder.setRequiredFields("firstName", "lastName");
		binder.setMessageCodesResolver(this.messageCodesResolver);
	}

	@Autowired
	@Qualifier("${$item.camelize(class_name)}Repository")
	private EntityRepository<${class_name}> rep;
	
	@RequestMapping(params = "action=show")
	public String show${class_name}(@RequestParam("id") Long id, Model model) {
		model.addAttribute("${$item.camelize(class_name)}", rep.getEntityByPrimaryKey(id));
		return "/${$item.camelize(class_name)}/show";
	}

	@RequestMapping(params = "action=list")
	public String listAll${class_name}(Model model) {
		List<${class_name}> ${$item.camelize(class_name)}s = rep.listAll();
		model.addAttribute("${$item.camelize(class_name)}s", ${$item.camelize(class_name)}s);
		return "/${$item.camelize(class_name)}/list";
	}

	@RequestMapping(params = "action=create")
	public String createNew${class_name}(Model model) {
		model.addAttribute("${$item.camelize(class_name)}", new ${class_name}());
		return "/${$item.camelize(class_name)}/create";
	}
	
	@RequestMapping(params = "action=edit")
	public String edit${class_name}(@RequestParam("id") Long id, Model model) {
		model.addAttribute("${$item.camelize(class_name)}", rep.getEntityByPrimaryKey(id));
		return "/${$item.camelize(class_name)}/create";
	}
	
	@RequestMapping(params = "action=remove")
	public String remove${class_name}(@RequestParam("id") Long id, Model model) {
		${class_name} ${$item.camelize(class_name)} = rep.getEntityByPrimaryKey(id);
		rep.removeEntity(${$item.camelize(class_name)});
		return listAll${class_name}(model);
	}

	@RequestMapping(params = "action=save")
	public String save${class_name}(@ModelAttribute("${$item.camelize(class_name)}") ${class_name} ${$item.camelize(class_name)}, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "/${$item.camelize(class_name)}/create";
		}

		rep.createEntity(${$item.camelize(class_name)});

		return listAll${class_name}(model);
	}

}
