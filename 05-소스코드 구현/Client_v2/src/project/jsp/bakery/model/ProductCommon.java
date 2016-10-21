package project.jsp.bakery.model;

public class ProductCommon {
	// ----------싱글톤 객체 생성을 위한 준비 시작---------

		private static ProductCommon current;

		public static ProductCommon getInstance() {
			if (current == null) {
				current = new ProductCommon();
			}
			return current;
		}

		public static void freeInstance() {
			// 객체에 null을 대입하면 메모리가 삭제된다.
			current = null;
		}

		// 기본 생성자를 private 로 은닉하게 되면 new를 통한 객체생성이 금지된다.
		private ProductCommon(){
				super();
			}
		// -------------싱글톤 객체 생성을 위한 준비 끝-----------
		
		public String getProductClassify(String classify) throws Exception{
			//리턴할 게시판 이름
			String productClassify = null;
			
			//카테고리값이 존재할 경우 게시판 이름 판별
			if(classify != null){
				if(classify.equals("a")){
					productClassify = "bread";
				} else if ( classify.equals("b")){
					productClassify= "cake";
				}  else if ( classify.equals("c")){
					productClassify= "cokie";
				} 
			}
			
			//생성된 게시판 이름이 없다면 예외를 발생시킨다.
			if(productClassify == null){
				throw new Exception("존재하지 않는 품종 입니다.");
			}
			
			return productClassify;
		}
	
}
