package foton.picture.xml;

import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * 
 * @author mn 
 * Date 2006-11-10 
 * 功能：文档模型单元
 * 
 */
public class DOMModelUtil {

	private DOMModelUtil() {

	}

	/**
	 * 遍历给定节点之后所有节点返回节点名为给定值的节点
	 * 
	 * @param node
	 *            传入节点
	 * @param nodeName
	 *            节点名字
	 * @return
	 */
	static public Node getNextNamedSibling(Node node, String nodeName) {
		Node nextSibling = node.getNextSibling();
		while (nextSibling != null
				&& !nextSibling.getNodeName().equals(nodeName)) {
			nextSibling = nextSibling.getNextSibling();
		}
		return nextSibling;
	}

	/**
	 * 遍历给定节点之前所有节点返回节点名为给定值的节点
	 * 
	 * @param node
	 * @param nodeName
	 * @return
	 */
	static Node getPreviousNamedSibling(Node node, String nodeName) {
		Node nextSibling = node.getPreviousSibling();
		while (nextSibling != null
				&& !nextSibling.getNodeName().equals(nodeName)) {
			nextSibling = nextSibling.getPreviousSibling();
		}
		return nextSibling;
	}

	/**
	 * 在给父节点之下给定节点前插入一个新的节点
	 * 
	 * @param parentNode
	 *            父节点
	 * @param element
	 *            新节点
	 * @param before
	 *            给定节点
	 */
	static public void addElementBefore(Node parentNode, Node element,
			Node before) {
		if (before == null) {
			parentNode.appendChild(element);
		} else {
			parentNode.insertBefore(element, before);
		}
	}

	/**
	 * 判断节点是否为空格
	 * 
	 * @param node
	 * @return
	 */
	static public boolean isWhiteSpace(Node node) {
		return node != null && node.getNodeType() == Node.TEXT_NODE
				&& node.getNodeValue().trim().length() == 0;
	}

	/**
	 * 返回给定父节点的名字为指定的名字孩子列表
	 * 
	 * @param element
	 *            父节点
	 * @param tagName
	 *            想得到的孩子节点的名字
	 */
	public static List getChildrenByTagName(Node element, String tagName) {
		if (element == null)
			return null;
		// getElementsByTagName gives the corresponding elements in the whole
		// descendance. We want only children

		NodeList children = element.getChildNodes();
		ArrayList goodChildren = new ArrayList();
		for (int i = 0; i < children.getLength(); i++) {
			Node currentChild = children.item(i);
			if (currentChild.getNodeType() == Node.ELEMENT_NODE
					&& ((Element) currentChild).getTagName().equals(tagName)) {
				goodChildren.add(currentChild);
			}
		}
		return goodChildren;
	}

	/**
	 * Gets the child of the specified element having the specified name. If the
	 * child with this name doesn't exist then the supplied default element is
	 * returned instead.
	 * 
	 * @param element
	 *            the parent element
	 * @param tagName
	 *            the name of the desired child
	 * @param defaultElement
	 *            the element to return if the child doesn't exist
	 * @return either the named child or the supplied default
	 */
	public static Element getOptionalChild(Element element, String tagName)
			{
		List goodChildren = getChildrenByTagName(element, tagName);

		if (goodChildren.size() == 1) {
			return (Element) goodChildren.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 根据取得根节点下的指定节点
	 * 
	 * @param parentNode
	 *            根节点
	 * @param nodeName
	 *            节点名字
	 * @param arrname
	 *            节点参数名字
	 * @param value
	 *            节点参数值
	 * @return
	 */
	public static Node getBeanNode(Node parentNode, String nodeName,
			String arrname, String value) {
		Node node = null;
		List list = DOMModelUtil.getChildrenByTagName(parentNode, nodeName);
		for (int i = 0; i < list.size(); i++) {
			Node node1 = (Node) list.get(i);
			System.out.println(node1.getAttributes().getNamedItem(arrname)
					.getNodeValue());
			if (node1.getAttributes().getNamedItem(arrname).getNodeValue()
					.equals(value)) {
				node = node1;
			}
		}
		return node;
	}
}
