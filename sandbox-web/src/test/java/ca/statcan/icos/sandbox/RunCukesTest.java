package ca.statcan.icos.sandbox;

import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@Cucumber.Options(glue = {"cucumber.api.spring", "ca.statcan.icos.sandbox"}, features = "classpath:SurveyPlanning", format = "json-pretty:target/icos-sandbox-web.json", tags = {"~@test-manually", "@regression,@active"})
public class RunCukesTest {
}
