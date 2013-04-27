package ca.statcan.icos.sandbox;

import ca.statcan.icos.sandbox.service.EmployeeEntityService;
import ca.statcan.icos.sandbox.web.MyFirstAction;
import cucumber.api.DataTable;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import cucumber.runtime.PendingException;

import org.openqa.selenium.By;
import org.openqa.selenium.Capabilities;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static junit.framework.Assert.assertEquals;

public class StepDefs {

    @Autowired
    protected EmployeeEntityService employeeEntityService;

    @Given("^the following divisions exist$")
    public void the_following_divisions_exist(DataTable arg1) throws Throwable {
        final List<Employee> employees = employeeEntityService.getAllEmployee();
        final Employee employee = new Employee(3, "Third", "John", null, "613-222-2223");
        employeeEntityService.persistEmployee(employee);
    }

    @Given("^there are no existing surveys$")
    public void there_are_no_existing_surveys() throws Throwable {
        assertEquals(1, employeeEntityService.getAllEmployee().size());
    }

    @When("^I register a new survey with the following information$")
    public void I_register_a_new_survey_with_the_following_information(DataTable arg1) throws Throwable {
    	Capabilities capabilities = DesiredCapabilities.htmlUnit();
    	final HtmlUnitDriver driver = new HtmlUnitDriver(capabilities);
        
        driver.get("http://localhost:8080/sandbox-web/myFirst");
        WebElement element = driver.findElement(By.id("name"));

        assertEquals("Employees", element.getText());
    }

    @Then("^the surveys are created$")
    public void the_surveys_are_created() throws Throwable {
    }

    @Then("^a confirmation message is displayed saying: \"([^\"]*)\"$")
    public void a_confirmation_message_is_displayed_saying(String arg1) throws Throwable {
    }
}
