package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Observable;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextArea;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;
import Model.AllQueries;
import Model.Post;
import Model.PostControllerDetails;
import application.Main;

public class BlogController {
	
	//Change empId.............
	static int empId ;
	
	static List<Post> posts = new ArrayList<>();
	static List<PostControllerDetails> postNodeDetails = new ArrayList<>();
	
	@FXML
	private VBox postList;
	
	@FXML 
	private TextArea postA ;
	
	@FXML
	private Button postB;
	
	@FXML
	private Button infoB;
	
	@FXML
	private Button btnLogOut;
	
	AdminController adminController;
	@FXML
	private void initialize() throws IOException, SQLException {
		empId = LoginController.obj.getUserId();
		
		System.out.println("blog controller .."+LoginController.obj.getUserId());
		loadPosts();
		loadPostList();
		postAOnClick();
		infoBOnClick();
		LogOut();
	}

	private void loadPosts() throws SQLException {
		posts = AllQueries.getAllPost();
	}

	private void infoBOnClick() {
		infoB.setOnAction(new EventHandler<ActionEvent>() {
			
			@Override
			public void handle(ActionEvent arg0) {
				if(validate())
				{
					String postDesc = postA.getText();
					String postType = "0";
					Date postDate = new Date();
					int postId;
					if(posts.isEmpty()) {
						postId = 1;
					}else {
						postId = posts.get(posts.size()-1).getPostId()+1;
					}
					Post postOb = new Post(postDesc,postType,postDate,empId,postId,0);
					try {
						AllQueries.setPostToTable(postOb);
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					posts.add(postOb);
					System.out.println(posts.get(posts.size()-1).getPostId());
					//write code to save post in post table
					
					//add new post node to observable list 
					FXMLLoader loader = new FXMLLoader();
					loader.setLocation(getClass().getResource("/resources/Post.fxml"));
					VBox post = null;
					try {
						post = loader.load();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					PostController controller = loader.getController();
					controller.setPostList(postList);
					try {
						controller.setPostId(postOb,post,controller);
					} catch (SQLException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					controller.loadEmpPost(LoginController.obj.getUserName().toString(), postA.getText());
					
					postList.getChildren().add(0,post);
					postA.setText("");
				}

			}
		});
	}

	private void postAOnClick() 
	{
			postB.setOnAction(new EventHandler<ActionEvent>() 
			{

				@Override
				public void handle(ActionEvent arg0) {
					if(validate())
					{
						String postDesc = postA.getText();
						String postType = "1";
						Date postDate = new Date();
						int postId ;
						if(posts.isEmpty()) {
							postId = 1;
						}else {
							postId = posts.get(posts.size()-1).getPostId()+1;
							System.out.println(postId);
						}
						Post postOb = new Post(postDesc,postType,postDate,empId,postId,0);
						try {
							AllQueries.setPostToTable(postOb);
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
						posts.add(postOb);
						System.out.println(posts.get(posts.size()-1).getPostId());
						//write code to save post in post table
						
						//add new post node to observable list 
						FXMLLoader loader = new FXMLLoader();
						loader.setLocation(getClass().getResource("/resources/Post.fxml"));
						VBox post = new VBox();
						try {
							post = loader.load();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						PostController controller = loader.getController();
						controller.setPostList(postList);
						try {
							controller.setPostId(postOb,post,controller);
						} catch (SQLException | IOException e) {
							// TODO Auto-generated catch block
							System.out.println("in getcontrpller....");
							e.printStackTrace();
						}

						controller.loadEmpPost(LoginController.obj.getUserName().toString(), postA.getText());
						
						postList.getChildren().add(0,post);
						postA.setText("");
					}

				}
				
			});
			
		
	}
	public void LogOut()
	{
		btnLogOut.setOnAction(new EventHandler<ActionEvent>()
		{
			@Override
			public void handle(ActionEvent event) 
			{
				LoginController.obj.cleanUserSession();
				Main main=new Main();
				Main.primaryStage.setTitle("Login");
				main.start(Main.primaryStage);
			}
			
		});
	}

	private void loadPostList() throws SQLException, IOException 
	{

		for(int i=1;i<posts.size();i++) {
			//write query load emp name and store to employeeName
			String employeeName = AllQueries.getEmpName(posts.get(i).getEmpID());
			String postDisplay = posts.get(i).getPostDesc();
			System.out.println("ckeck....1");
			
			FXMLLoader loader = new FXMLLoader();
			
			loader.setLocation(getClass().getResource("/resources/Post.fxml"));
			System.out.println("ckeck....2");
			VBox post = null;
			try {
				post = loader.load();
				System.out.println("ckeck....3");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			PostController controller = loader.getController();
			controller.setPostList(postList);
			System.out.println("ckeck....4");
			controller.setPostId(posts.get(i),post,controller);
			controller.loadEmpPost(employeeName, postDisplay);
			System.out.println("ckeck....5");
			postList.getChildren().add(0,post);
		}
		
	}

	public void AdminController(AdminController adminController2) 
	{
		adminController=adminController2;
		
	}
	public boolean validate() {
        StringBuilder errorMessage = new StringBuilder();

        if (postA.getText().isEmpty())
        {
              errorMessage.append("Enter Your Post First\n");
        }
        if (errorMessage.length() != 0) {
                showAlert(Alert.AlertType.ERROR, "Form Error!", errorMessage.toString());
                return false;
        }
        return true;
	}
	private void showAlert(Alert.AlertType alertType, String title, String message) 
	{
		Alert alert = new Alert(alertType);
		alert.setTitle(title);
		alert.setHeaderText(null);
		alert.setContentText(message);
		alert.initOwner(Main.primaryStage);
		alert.show();
	}	
}
