package google.api;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/google")
public class GoogleController {
	 @Autowired
	  private GoogleConnectionFactory googleConnectionFactory;

	  @Autowired
	  private OAuth2Parameters googleOAuth2Parameters;

	// 로그인 첫 화면 요청 메소드
		@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
		public String login(Model model, HttpSession session) {

			/* 구글code 발행 */
			OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
			String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

			System.out.println("구글:" + url);

			model.addAttribute("google_url", url);

			/* 생성한 인증 URL을 View로 전달 */
			return url;
		}


		@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String googleCallback(Model model, @RequestParam String code) throws IOException {
			System.out.println("여기는 googleCallback");

			return "googleSuccess";
		}
		
//		
//		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
//			    // Specify the CLIENT_ID of the app that accesses the backend:
//			    .setAudience(Collections.singletonList(CLIENT_ID))
//			    // Or, if multiple clients access the backend:
//			    //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
//			    .build();
//
//			// (Receive idTokenString by HTTPS POST)
//
//			GoogleIdToken idToken = verifier.verify(idTokenString);
//			if (idToken != null) {
//			  Payload payload = idToken.getPayload();
//
//			  // Print user identifier
//			  String userId = payload.getSubject();
//			  System.out.println("User ID: " + userId);
//
//			  // Get profile information from payload
//			  String email = payload.getEmail();
//			  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
//			  String name = (String) payload.get("name");
//			  String pictureUrl = (String) payload.get("picture");
//			  String locale = (String) payload.get("locale");
//			  String familyName = (String) payload.get("family_name");
//			  String givenName = (String) payload.get("given_name");
//
//			  // Use or store profile information
//			  // ...
//
//			} else {
//			  System.out.println("Invalid ID token.");
//			}

}
