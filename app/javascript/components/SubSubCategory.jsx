import React from 'react';

class SubSubCategory extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			subsubcategory_id: '',
			subsubcategories: []
		};
	}
	componentDidMount(){
		fetch('/api/v1/subsubcategories.json')
			.then((response) => {return response.json()})
			.then((data) => {this.setState({ subsubcategories: data }) });
	}
	render(){
		const subsubcategory = this.state.subsubcategories.map((category) => {
			return(<option key={category.id} value={category.id}>{category.name}</option>)
		});
		return(
			<select name="course[subsubcategory_id]" id="course_subsubcategory_id">
				<option value="">Choose a category</option>
				{subsubcategory}
			</select>
		)
	}
}

export default SubSubCategory