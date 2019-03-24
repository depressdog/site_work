import React from 'react'
import Category from './Category'
import SubCategory from './SubCategory'
import SubSubCategory from './SubSubCategory'

class CourseForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            category_id: '',
            categories: [],
            subcategory_id: '',
            subcategories: [],
      			subsubcategories: []
        };
    }
    handleInput(e) {
     let value = e.target.value;
     let name = e.target.name;
     this.setState( prevState => {
        return {
           newUser : {
                    ...prevState.newUser, [name]: value
                   }
        }
     }, () => console.log(this.state.newUser)
     )
 }

    componentDidMount(){
        fetch('/api/v1/categories')
            .then((response) => {return response.json()})
            .then((data) => {this.setState({ categories: data }) });
            console.log(this.state.category_id)
        fetch('/api/v1/subcategories/' + this.state.category_id )
      			.then((response) => {return response.json()})
      			.then((data) => {this.setState({ subcategories: data }) });
        fetch('/api/v1/subsubcategories')
      			.then((response) => {return response.json()})
      			.then((data) => {this.setState({ subsubcategories: data }) });
    }

    render(){
      const category = this.state.categories.map((category) => {
          return(<option key={category.id} value={category.id}  >{category.name}</option>)
      });
      const subcategories = this.state.subcategories.map((category) => {
  			return(<option key={category.id} value={category.id}>{category.name}</option>)
  		});
      const subsubcategory = this.state.subsubcategories.map((category) => {
  			return(<option key={category.id} value={category.id}>{category.name}</option>)
  		});
        return(
            <div className="three fields">
              <select name="course[category_id]" id="course_category_id" >
                  // <option  value="">Выбор категории</option>
                  {category}
              </select>
              <select name="course[subcategory_id]" id="course_subcategory_id">
                <option value="">Выбор подкатегории</option>
                {subcategories}
              </select>
              <select name="course[subsubcategory_id]" id="course_subsubcategory_id">
                <option value="">Choose a category</option>
                {subsubcategory}
              </select>
            </div>
        )
    }
}

export default CourseForm
