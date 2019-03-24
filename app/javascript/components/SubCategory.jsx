import React from 'react';

class SubCategory extends React.Component {
	constructor(props) {
		super(props);
		this.state = {
			subcategory_id: '',
			subcategories: []
		};
	}
	componentDidMount(){
		fetch('/api/v1/subcategories.json')
			.then((response) => {return response.json()})
			.then((data) => {this.setState({ subcategories: data }) });
	}
	render(){
		const subcategories = this.state.subcategories.map((category) => {
			return(<option key={category.id} value={category.id}>{category.name}</option>)
		});
		return(
			<select name="course[subcategory_id]" id="course_subcategory_id">
				<option value="">Выбор подкатегории</option>
				{subcategories}
			</select>
		)
	}
}

export default SubCategory