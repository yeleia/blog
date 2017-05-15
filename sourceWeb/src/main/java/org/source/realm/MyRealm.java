package org.source.realm;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.source.entity.User;
import org.source.service.UserService;

import javax.annotation.Resource;


/**
 * Created by yelei on 17-4-12.
 */
public class MyRealm extends AuthorizingRealm{

	@Resource
	private UserService userService;

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)
			throws AuthenticationException {
		String userName=(String)token.getPrincipal();
		User user=userService.getByUserName(userName);
		if(user!=null){
			// 当前用户信息存到session中
			SecurityUtils.getSubject().getSession().setAttribute("currentUser", user);
			AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(
					user.getUserName(),user.getPassword(),"yelei");
			return authcInfo;
		}else {
			return null;
		}
	}
}
