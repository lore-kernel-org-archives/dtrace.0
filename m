Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F41F0995
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 05:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772688316; cv=fail; b=GS1Wx1za0K5gMpAJLKNGo9MSccfSeg5nNWhpKxN1aKRPQVfOpKCgN1jylLqtiSfSLcIZDcbp2dUCrumZT1//tjvOGR+XgSH6ZibBkkT/OY0gk2TZasN6DsS2wepV8O+MMOvBRXE/uXK48bFi+ovSMA1vV2CNVVoLevNdZwQJN/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772688316; c=relaxed/simple;
	bh=Y/gvsWwnAulkDOBaG9kZB6oUuunJS88jAKcS6TOEDXA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=SW8u+gYPDqC1hzFo58PsYDJOEyb4O9HTiMYMl5J+Z4K3ez/l/0lq/FbS3SehZMfcCfoJgRVvrpe7pe9hKNLvrmc/+fppUfxEjZOahD5u6M2xE9eYLwDhnayIjxlpupg/fmoMgVBHnvKUgKNq9VvjTJVafdNDjK1Ub2OOdTWuHMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EDJfijaK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PA408CJ/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EDJfijaK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PA408CJ/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62551nRp3633167
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 05:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=jk0htld5AlzxsKru/dwCUTm6/jYRQtVxpfimhpfnZxU=; b=
	EDJfijaK0BpaYx49QJOW5hqtS+fniTNR8z0ebDu9CCYsyPd303A9Ux9PQj8uIuw+
	HyZn9Si2nKCya32cqACpB7xJhQYgEug3Vk4KwLBvJVbYH/DMYPEKI8TpWIaZJVQV
	XZteWnU61RM+xYByQkHm10uhg8ypmIF1ZXlrBVHoCWkzJ/43XWDH/mash8TJBm9D
	IQWxq9UfANG36Z4uQLU9vNv5zluMegZtkfQ/+tKqCwncqjhX7GeZgNh9g8Rxo0R1
	pBB//HA+Bw7RkXN9G39FHFdHQyn0aU5jXxmzaRfKnNmojSEislJjEq986/WGNqk/
	VP49jxfVyY0316ZZZBeQOQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cq3apr0ga-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 05:25:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 6253aXaL037139
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 05:01:29 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010067.outbound.protection.outlook.com [52.101.85.67])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptcfqrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 05:01:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wiku2q7SIlUYhFkl33EMrqEEFPEvK20daTyzgYcW2DjscgnmUELOY2lbWDoxvff/7Lfel2IejHJLaj/aQJxHOJaGiT8X5364xQ5A0+InY8D9b8Sg0ExKs4TKwteOKksdOBdeIKW7wYvcPvAiUOaKZnHuMRbDYkjnhsbpYGxHtg+q6um1vjMI/+/NI5Ib306wG0M+l94EckK1PbA5ibVbMmVQX8DyxOSCmM8vXnj8OOd1LqVCmFTSp4PGqvaux8sQZbQj8gwPUm8Rk/r4ot/8wiurEm9yVRK3RU7T6Yl8unnomnv8wZJl0EG8CFDIRi5nBCD/XBIqEyMZFSyluDzmfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jk0htld5AlzxsKru/dwCUTm6/jYRQtVxpfimhpfnZxU=;
 b=SBTwVE7Y3VIXSRcJuz48dEOMoykubHGwfc/sikXFM9ZoVTUIJqJ+U7kiRX4c67RVFFXetW/kG8grSeAmk8UYM07xQUdxtmSGG9uGfInkfyWoBYPbcNy2MZ8vCLSuJwOCDGL1bV2J64a62FWn70NlF+DwPYG5ihrLO2t7Kf8NFm8TE/oUb9kA8aB1XNzHYO5bo58aFgzhQaMvvgbEUvlRr1P6Tt5P3XUBub//Q9lJcSpfD3nfhf2hMNztQJ38AMU0g7TKD5trZHR/Gz16/Ew4NV07/VIVXQnJ0aNUhfzRCWUcmrx+vIpocGwVH4kOuz9IJX2iRQFBOBw+NKhstPxE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jk0htld5AlzxsKru/dwCUTm6/jYRQtVxpfimhpfnZxU=;
 b=PA408CJ/C+Boe0cP6HQvfadY7qpI8PTtHzKrYWSBV6U0veEXuKW+M6ADX6rNtB3mI9HoNSsyWxB6LCADOvMvEpOxRWWvOb3btRw+oC3hZXbKNeRYyx5b5YGY4U4pk/lB8/q3Ae1/y2Fe2Pa6mXzVPCNZQbKB4ErjgTzu7Af7/mo=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DM6PR10MB4378.namprd10.prod.outlook.com (2603:10b6:5:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 05:01:24 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 05:01:24 +0000
Date: Thu, 05 Mar 2026 00:01:23 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] sparc: remove architecture support
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752247D5B7EEE9ED7D223109C27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DM6PR10MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 8285e742-1c61-4c48-6c19-08de7a744029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	bjCyLF9UZzb0tXX8cbnDNFyul92n1AJvdFgFHsn69oAr8YF0gYUmTyVhtCDWEwZtrx8QXTvItxakyuXeDoEcKF42XQQil5tInNVYLhaezTf/Gfnc4HNmOQMZmXw4mbGnF1ZH9g4dJH0Qw6G0hVG3dLO0WblfUn4cQkKuh66+S4ZGCQFHNhKswSiR3ErE1+9JxyR7b5saxHabubiQDYzKId4R9S7ruCTawohqDN1qUPL07n42X+r+PS2/as4NwAZQUdG6MqxYNC6wqcOPspeGxXHPIcG4oGx5cH4ebHfkZa5lJnahhYGohuZ4cIhN6RlQDjPAAF1SIZbmDFlNE+YChYIzV4OLBbjW4y7PBhLXPXbn7NEO8PmetBocpk41PuY8nfGuUIqPrqvnbIMGvuoGuTSoX3ZyGe2xyDOXfC6XqI51COcgJzgafaWlqIs9WyyJxF0CZqeWF63b75h6gYVpOJSBJK+d3BLUcjG2kKNkTXPE15H05msU0clORJK4QMWljvM+ztVnHtoNdUgX+OCWRGEf7HZPSBk58QTsfKN1Wz0UJRIymgVpnMhkTPIN4WJy6FbsZea2PBIXDauK5CCz2FY7AGDst7Jt+gjB4L8WbbphK4gqQtOyMpTydKM2RSunFJI/UIQ0TbEFEpIqeOpy4vuhO5EYPjcEpYxIF3TyNqt860A9QPVFzBLCGDQShHEsO8k+xmiFH1TJ5ud1NPC//dDFKsGAg2rk6buOX+vRrRM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uk5YZO9v94mwB8bJE5t4Fl02Kg4fO30uOGLRqfjWikstttMbOYE79N2ucRFO?=
 =?us-ascii?Q?tacSAuX9uqN7KXvbME2bo9hnG1WCc1IY/zcydLhosTlj1BwkzeIRFWDOycD7?=
 =?us-ascii?Q?HAggYdOQrMcNQ6IE4LC6h6Ir5SlaHP/1GOWKS9+iD177JzxzxWZYoRKIq+hP?=
 =?us-ascii?Q?XaR1uhlclW9oA2lqqiM5YqxutGxgN/fiT7e0WlFF8CMjIJDnF7uCvVoitE5C?=
 =?us-ascii?Q?67GdIRXpLuOTnSu+MvA+PjXkGhQgROiGR4AdrQafYIw+iL9CRUym2eMncxGd?=
 =?us-ascii?Q?n/GHJCJGvtngRlDodWmckVi0dRv+AUJ2+jaqpcqJv6ojJHvFyvtz0XfENDGn?=
 =?us-ascii?Q?wdTAI3a7WcCGNfXcPU2k72e7nIOdSenYshErGeoAMzU6Ns+UJnabMzQd9984?=
 =?us-ascii?Q?+9Qdvwtk0pAnXBGUpxPhxI/oUaZ9WbfKp8uvQGlbRcf26WTc7G0gDWDd+aGS?=
 =?us-ascii?Q?/+3YUFs8hs5sINF5833zYl3D4FChS/gOOBRDFl+E+Kc4zobJWghzF9+CJz+N?=
 =?us-ascii?Q?B26C3MJeof40X2CrPwqeptxBW/j/d7mWTyUephKrO9zWje2k/BT1qGsGDIyx?=
 =?us-ascii?Q?VZENm+0EALHXhwEc6XE8HwGrVMbBtc61HIcRF/vkCROVIQup5aKggqMPErNI?=
 =?us-ascii?Q?aE0tzyTOx6BHGGKZnplwdb6Be+FbP8A3/S2VCT0091Bg9mYtILNeKY4Yyj/e?=
 =?us-ascii?Q?Y/EIyWwLTkHZ1Q5kQEE01UfW/0/odh0cLHxj4IS4iVBNizFeSkjdqgpiFUNu?=
 =?us-ascii?Q?5w6jKUJioUjWFAqPhPll/56ajfJeUo1PG5BPlyUtn7hGivcRrj/qnJ4wK/RK?=
 =?us-ascii?Q?TwateLy4HWssJ1X/xTmOl6wQ6/ZDV9T80fIXAhidC4/kzHnVlWhxM/XsOwT5?=
 =?us-ascii?Q?lnawohnU5jL5MytuytQxwBz3omfxTLzzAb+GWImUe5HAdL/t7BVAeteTiIxV?=
 =?us-ascii?Q?EDNaMAhKHzhq65oZpeBErPSRwEm/YVZRS0zQolqvGGsL0u2FKQrVQTTTBp0V?=
 =?us-ascii?Q?Ej0Nt96O1DIOq/WCLa8HmnucBe8/waJ7sHu8zjuvk1V8iA3alwobSUamygdQ?=
 =?us-ascii?Q?/qWK3bmAqgS0eZHxZZ+pMS/Jcep7LR2eLjyci4TKdPOHS1Y50Q3oaPFWVbsk?=
 =?us-ascii?Q?oeS65gS5WapyCgjiU2X19jLUTzp3NArTjYsTstmR9brdgweB8WfnB5oM34RH?=
 =?us-ascii?Q?DOB/Z3xTQIfJ6PsIfoVhYWGPMIoLZgUONJ4EmyPdj19Ct3jRd82Lh1hnd7H7?=
 =?us-ascii?Q?cvUP2Ue+Vx2LTBK6yBsyFDZM7SJbO6HSH+z8yZgiGih5U4NZmqwqmW+p55jy?=
 =?us-ascii?Q?Ci+fuxY5zviBqM4GHQXuY5c4DZeiCpwrg34DmgZ2PJ3E/ZmG+YlV/Ugt+eVm?=
 =?us-ascii?Q?2j44QQpd8iV4Z6YH7apN5dZOEqp+aMOq9vxOVyr9vzLgGITe2LwrjR4ZCljU?=
 =?us-ascii?Q?2BYFryKXuzkZPpihoFVPvsL1laMuIH65+5UnwtmpYdl8Xxkp6l6eY55Ns5Ac?=
 =?us-ascii?Q?sMmBBpzVHNtZ6jB6Y2CpRrljVrqXylJHmHBE9etAH8+g67YaXs+/iB/FzoAS?=
 =?us-ascii?Q?lEZJpwLbrW2KZ9JYAnxo59FK7pl7gREn1FZLSZInsS66eFnxPklkZjjqyzzX?=
 =?us-ascii?Q?fC9boylqbFfs/ctR6l49Z/PxYgX8Ggj50TPvcPqkMoOn+0K1umaALaNktFeV?=
 =?us-ascii?Q?p5JVqxTcg5+GtJ0tELjkJa2fGDb/DQlKVPlHRgC+Sij7pXKC2r76vmq2bj+B?=
 =?us-ascii?Q?5wbrl5g1WQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dDrs7s13CDD1llBY/sjNEv2IKnr+3mUzx3m34FQIToGAaj5oGjNe+i/3CMEYGa+HuZ0FslDLrdwZGBw/4uPJbGG/sfbsYcOKudsW+L3g5qBttdbPu1VR+zqedQ+Ym0LhGyDXpsnf7D5frw9TRqdZREG1QyuepicVVYVhcCeiLQE66iAHBknew4sOjdjEj6Ro2Zt24qQqf+Ih3388dtcfC28DsPh+6kMsxLSqN7S9BeZ0JL4NvWPlxyjpa5sxqm4DAMlpts7zu/B+efSyp6GcQTK9LnkFQCsZ6LqUrI7jS8KM+9deG0IGcX38JRcwbv/pCKIhWgDV1Fh3HW5dVWeCJMaMDzi/LbSWlvA9HlXEqjrtU7JFJfDrgg+Y3VatabO9JsK8iIoetq+2wjpeeKJrNCL3jyMn4yiTNx+RVqWjaZJg8Kvv4BwAiqb4Btg2s5RMC1xWqbbZfk91wHlGEpyl2KtnmPZWQO9yKzUHcPawKn5RK18ahIxVcT0+cIhbQi2xQFxl+iDhV6a4/1nO9VahaMViwdPQQGXF/NgNTmcQQzF3Up2V6639LAnv/ue0JVoWwRBCyDxJa5W01qyMvz3dS/j+sULH5yQ//16C5Ip0OuM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8285e742-1c61-4c48-6c19-08de7a744029
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 05:01:24.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njDGMmDNw0Kc11WWglPxMQ6Kgp04BsMeQpMN6WUFcyY9ctroEaCDz7HCO8mWBPLrXHD+wXf3RpHuEw80GsKFKwBYN85d73TRL7y0FfDH4Po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4378
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603050034
X-Proofpoint-ORIG-GUID: XyYkAZ2lGlKTMX1oT8fpOV2_o-jwvWWr
X-Proofpoint-GUID: XyYkAZ2lGlKTMX1oT8fpOV2_o-jwvWWr
X-Authority-Analysis: v=2.4 cv=N8Uk1m9B c=1 sm=1 tr=0 ts=69a913b9 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=J-ID-OhWRF7FC322MRIA:9
 a=3ZKOabzyN94A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzOSBTYWx0ZWRfX42mJZUvwLCxY
 Z4Q2e3HIsxP0neNcmzQQtxUkSJ/AkidVoMYL4YgexanYvl1U2b/ozClfHqXYVVAtKb2BRXTfwd5
 TVHU0nsxNR8oAaFP/JLWiBX+TJEUr6okBH2v3MpWgD07qSm2sejS8czQfngveixz4utrBlZtx2U
 6GZA0S4VUDd8dgteOOFH7LtefNd+oCUoIeB40dl7TyeBAfeDaW3T1C/W8xl04Tc0eELiIOXYvH2
 AIy6u7sQTVZcfry4RBmLap9PH15uksjWpIecRCJo3auCH6XEAvctBZqNJfP1VR2whUBvMVArwXm
 U2jalgyB0H9cpVhGnsV4AoC79+Y3KbJGPFWOOER3eb5wuY3XnyJVa/9iHlkAWLN5zMnTtxDH+my
 thq1H6kKwx8GY7NAEbISIESsIRspHqXDv2Bx8aJ0vEp+OFduSH1A69JFdzPLalpbhFaLW/TGGXM
 4Z9jQhcD7YIcrdODh8A==

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 COMMANDLINE-OPTIONS                           |   6 +-
 GNUmakefile                                   |  10 +-
 include/sparc/platform.h                      |  32 -----
 libdtrace/dt_link.c                           |   4 +-
 libdtrace/dt_open.c                           |  16 +--
 libdtrace/procfs.d.in                         |   4 +-
 libdtrace/sparc/regs.d                        |  99 -------------
 libproc/sparc/isadep.c                        | 133 ------------------
 libproc/sparc/isadep.h                        |  81 -----------
 test/stress/fbtsafety/tst.vahole.d            |  50 -------
 test/unittest/aggs/tst.neglquant.d            |  10 +-
 test/unittest/arrays/tst.uregsarray.sparc64.d |  69 ---------
 test/unittest/arrays/tst.uregsarray.sparc64.x |   4 -
 test/unittest/pid/test.sparc64.options        |   1 -
 test/unittest/usdt/tst.enabled2.sh            |   2 +-
 15 files changed, 16 insertions(+), 505 deletions(-)
 delete mode 100644 include/sparc/platform.h
 delete mode 100644 libdtrace/sparc/regs.d
 delete mode 100644 libproc/sparc/isadep.c
 delete mode 100644 libproc/sparc/isadep.h
 delete mode 100755 test/stress/fbtsafety/tst.vahole.d
 delete mode 100644 test/unittest/arrays/tst.uregsarray.sparc64.d
 delete mode 100755 test/unittest/arrays/tst.uregsarray.sparc64.x
 delete mode 100644 test/unittest/pid/test.sparc64.options

diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS
index 73be89b1..67be7447 100644
--- a/COMMANDLINE-OPTIONS
+++ b/COMMANDLINE-OPTIONS
@@ -3,8 +3,8 @@ DTRACE OPTIONS
 
 This file lists the dtrace commandline options, and indicates whether
 or not they have been made to work on Linux and roughly when.  All options
-are believed to work equally well on all supported architectures (x86 and
-SPARC).
+are believed to work equally well on all supported architectures (x86_64 and
+ARM64).
 
 Notations:
 
@@ -317,8 +317,6 @@ definitions are always specified and valid in all modes:
     * __linux
     * __unix
     * __SVR4
-    * __sparc (on SPARC® systems only)
-    * __sparcv9 (on SPARC® systems only when 64–bit programs are compiled)
     * __i386 (on x86 systems only when 32–bit programs are compiled)
     * __amd64 (on x86 systems only when 64–bit programs are compiled)
     * __`uname -s` (for example, __Linux)
diff --git a/GNUmakefile b/GNUmakefile
index 835bc9b5..10530f3c 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -20,8 +20,8 @@ VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)
 
 ARCH := $(shell uname -m)
 
-$(if $(subst sparc64,,$(subst aarch64,,$(subst x86_64,,$(ARCH)))), \
-    $(error "Error: DTrace for Linux only supports x86_64, ARM64 and sparc64"),)
+$(if $(subst aarch64,,$(subst x86_64,,$(ARCH))), \
+    $(error "Error: DTrace for Linux currently only supports x86_64 and ARM64"),)
 $(if $(subst Linux,,$(shell uname -s)), \
     $(error "Error: DTrace only supports Linux"),)
 
@@ -74,7 +74,7 @@ ifdef KERNELSRCDIR
 KERNELOBJDIR ?= $(KERNELSRCDIR)
 endif
 
-KERNELARCH := $(subst sparc64,sparc,$(subst aarch64,arm64,$(subst x86_64,x86,$(ARCH))))
+KERNELARCH := $(subst aarch64,arm64,$(subst x86_64,x86,$(ARCH)))
 
 # Paths.
 
@@ -120,7 +120,7 @@ export CC ?= gcc
 
 BITNESS := 64
 NATIVE_BITNESS_ONLY := $(shell echo 'int main (void) { }' | $(CC) -x c -o /dev/null -m32 - 2>/dev/null || echo t)
-ARCHINC := $(subst sparc64,sparc,$(subst aarch64,arm64,$(subst x86_64,i386,$(ARCH))))
+ARCHINC := $(subst aarch64,arm64,$(subst x86_64,i386,$(ARCH)))
 
 INVARIANT_CFLAGS := -std=gnu99 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 $(if $(NATIVE_BITNESS_ONLY),-DNATIVE_BITNESS_ONLY) -D_DT_VERSION=\"$(VERSION)\"
 CPPFLAGS += -Iinclude -Iuts/common -Iinclude/$(ARCHINC) -I$(objdir)
@@ -129,7 +129,7 @@ override CFLAGS += $(INVARIANT_CFLAGS)
 PREPROCESS = $(CC) -E
 export BPFC ?= bpf-unknown-none-gcc
 
-BPFCPPFLAGS += -D$(subst sparc64,__sparc,$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH))))
+BPFCPPFLAGS += -D$(subst aarch64,__aarch64__,$(subst x86_64,__amd64,$(ARCH)))
 BPFCFLAGS ?= -O2 -Wall -Wno-unknown-pragmas $(if $(HAVE_BPFV3),-mcpu=v3) $(if $(HAVE_BPFMASM),-masm=normal) -ffreestanding
 export BPFLD ?= bpf-unknown-none-ld
 
diff --git a/include/sparc/platform.h b/include/sparc/platform.h
deleted file mode 100644
index 1dea6ea2..00000000
--- a/include/sparc/platform.h
+++ /dev/null
@@ -1,32 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2013, 2015, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#ifndef _SPARC_PLATFORM_H
-#define _SPARC_PLATFORM_H
-
-#include <inttypes.h>
-#include <asm/ptrace.h>
-#include <elf.h>
-#include <sys/syscall.h>			/* for __NR_* */
-
-/*
- * Must be no larger than an 'unsigned long'.
- */
-const static unsigned char plat_bkpt[] = { 0x91, 0xd0, 0x20, 0x01 };
-
-/*
- * Number of processor-specific dynamic tags on this platform.
- */
-#define DT_THISPROCNUM DT_SPARC_NUM
-
-/*
- * TRUE if this platform requires software singlestepping.
- */
-#define NEED_SOFTWARE_SINGLESTEP 1
-
-#endif
-
diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index 6d733881..340273fb 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -524,9 +524,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 
 		if (dtp->dt_oflags & DTRACE_O_ILP32) {
 			snprintf(drti, sizeof (drti), "%s/drti/drti32.o", libdir->dir_path);
-#if defined(__sparc)
-			emu = " -m elf32_sparc";
-#elif defined(__i386) || defined(__amd64)
+#if defined(__i386) || defined(__amd64)
 			emu = " -m elf_i386";
 #endif
 		} else {
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 54adec02..30b8758d 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -827,24 +827,10 @@ dt_vopen(int version, int flags, int *errp,
 	else if (flags & DTRACE_O_ILP32)
 		dtp->dt_conf.dtc_ctfmodel = CTF_MODEL_ILP32;
 
-#ifdef __sparc
-	/*
-	 * On SPARC systems, __sparc is always defined for <sys/isa_defs.h>
-	 * and __sparcv9 is defined if we are doing a 64-bit compile.
-	 */
-	if (dt_cpp_add_arg(dtp, "-D__sparc") == NULL)
-		return set_open_errno(dtp, errp, EDT_NOMEM);
-
-	if (dtp->dt_conf.dtc_ctfmodel == CTF_MODEL_LP64 &&
-	    dt_cpp_add_arg(dtp, "-D__sparcv9") == NULL)
-		return set_open_errno(dtp, errp, EDT_NOMEM);
-#endif
-
 #ifdef __x86
 	/*
 	 * On x86 systems, __i386 is defined for <sys/isa_defs.h> for 32-bit
-	 * compiles and __amd64 is defined for 64-bit compiles.  Unlike SPARC,
-	 * they are defined exclusive of one another (see PSARC 2004/619).
+	 * compiles and __amd64 is defined for 64-bit compiles.
 	 */
 	if (dtp->dt_conf.dtc_ctfmodel == CTF_MODEL_LP64) {
 		if (dt_cpp_add_arg(dtp, "-D__amd64") == NULL)
diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
index 23454d63..4140608b 100644
--- a/libdtrace/procfs.d.in
+++ b/libdtrace/procfs.d.in
@@ -285,9 +285,7 @@ translator lwpsinfo_t < struct task_struct *T > {
 define_for_kernel([[on_cpu]], [[(m4_kver(5,16,0), m4_dnl
   [[((struct thread_info *)T->stack)->cpu]]), m4_dnl
 (m4_kver(4,9,0), m4_dnl
-  [[if_arch([[x86]],[[T->cpu]])]] m4_dnl
-  [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
-  [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]], m4_dnl
+  [[T->cpu]])]], m4_dnl
 [[((struct thread_info *)T->stack)->cpu]])m4_dnl
 	pr_onpro = on_cpu;
 };
diff --git a/libdtrace/sparc/regs.d b/libdtrace/sparc/regs.d
deleted file mode 100644
index 112ae207..00000000
--- a/libdtrace/sparc/regs.d
+++ /dev/null
@@ -1,99 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2012, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-inline int R_G0	= 0;
-#pragma D binding "1.0" R_G0
-inline int R_G1	= 1;
-#pragma D binding "1.0" R_G1
-inline int R_G2	= 2;
-#pragma D binding "1.0" R_G2
-inline int R_G3	= 3;
-#pragma D binding "1.0" R_G3
-inline int R_G4	= 4;
-#pragma D binding "1.0" R_G4
-inline int R_G5	= 5;
-#pragma D binding "1.0" R_G5
-inline int R_G6	= 6;
-#pragma D binding "1.0" R_G6
-inline int R_G7	= 7;
-#pragma D binding "1.0" R_G7
-
-inline int R_O0	= 8;
-#pragma D binding "1.0" R_O0
-inline int R_O1	= 9;
-#pragma D binding "1.0" R_O1
-inline int R_O2	= 10;
-#pragma D binding "1.0" R_O2
-inline int R_O3	= 11;
-#pragma D binding "1.0" R_O3
-inline int R_O4	= 12;
-#pragma D binding "1.0" R_O4
-inline int R_O5	= 13;
-#pragma D binding "1.0" R_O5
-inline int R_O6	= 14;
-#pragma D binding "1.0" R_O6
-inline int R_O7	= 15;
-#pragma D binding "1.0" R_O7
-
-inline int R_L0	= 16;
-#pragma D binding "1.0" R_L0
-inline int R_L1	= 17;
-#pragma D binding "1.0" R_L1
-inline int R_L2	= 18;
-#pragma D binding "1.0" R_L2
-inline int R_L3	= 19;
-#pragma D binding "1.0" R_L3
-inline int R_L4	= 20;
-#pragma D binding "1.0" R_L4
-inline int R_L5	= 21;
-#pragma D binding "1.0" R_L5
-inline int R_L6	= 22;
-#pragma D binding "1.0" R_L6
-inline int R_L7	= 23;
-#pragma D binding "1.0" R_L7
-
-inline int R_I0	= 24;
-#pragma D binding "1.0" R_I0
-inline int R_I1	= 25;
-#pragma D binding "1.0" R_I1
-inline int R_I2	= 26;
-#pragma D binding "1.0" R_I2
-inline int R_I3	= 27;
-#pragma D binding "1.0" R_I3
-inline int R_I4	= 28;
-#pragma D binding "1.0" R_I4
-inline int R_I5	= 29;
-#pragma D binding "1.0" R_I5
-inline int R_I6	= 30;
-#pragma D binding "1.0" R_I6
-inline int R_I7	= 31;
-#pragma D binding "1.0" R_I7
-
-inline int R_CCR = 32;
-#pragma D binding "1.0" R_CCR
-inline int R_PC = 33;
-#pragma D binding "1.0" R_PC
-inline int R_nPC = 34;
-#pragma D binding "1.0" R_nPC
-inline int R_NPC = R_nPC;
-#pragma D binding "1.0" R_NPC
-inline int R_Y = 35;
-#pragma D binding "1.0" R_Y
-inline int R_ASI = 36;
-#pragma D binding "1.0" R_ASI
-inline int R_FPRS = 37;
-#pragma D binding "1.0" R_FPRS
-inline int R_PS = R_CCR;
-#pragma D binding "1.0" R_PS
-inline int R_SP = R_O6;
-#pragma D binding "1.0" R_SP
-inline int R_FP = R_I6;
-#pragma D binding "1.0" R_FP
-inline int R_R0 = R_O0;
-#pragma D binding "1.0" R_R0
-inline int R_R1 = R_O1;
-#pragma D binding "1.0" R_R1
diff --git a/libproc/sparc/isadep.c b/libproc/sparc/isadep.c
deleted file mode 100644
index aa4f53f5..00000000
--- a/libproc/sparc/isadep.c
+++ /dev/null
@@ -1,133 +0,0 @@
-/*
- * ISA-dependent functions for SPARC and SPARC64.
- */
-
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#include <inttypes.h>
-#include <errno.h>
-#include <string.h>
-#include <sys/ptrace.h>
-#include <asm/ptrace.h>				/* for struct pt_regs */
-
-#include "Pcontrol.h"
-#include "libproc.h"
-#include "platform.h"
-
-#define PTRACE_GETREGSET        0x4204
-
-/*
- * Get a SPARC64 regset.
- */
-static struct pt_regs *
-getregs_sparc64(struct ps_prochandle *P, struct pt_regs *regs)
-{
-	if (Pstate(P) == PS_RUN ||
-	    Pstate(P) == PS_DEAD)
-		return NULL;
-
-	if (wrapped_ptrace(P, PTRACE_GETREGS64, P->pid, regs) < 0)
-		return NULL;
-
-	return regs;
-}
-
-static struct pt_regs32 *
-getregs_sparc32(struct ps_prochandle *P, struct pt_regs32 *regs)
-{
-	if (Pstate(P) == PS_RUN ||
-	    Pstate(P) == PS_DEAD)
-		return NULL;
-
-	if (wrapped_ptrace(P, PTRACE_GETREGS, P->pid, regs) < 0)
-		return NULL;
-
-	return regs;
-}
-
-/*
- * Read the first argument of the function at which the process P is halted,
- * which must be a pointer (though other integral arguments happen to work for
- * the SPARC and SPARC64 ABI).
- *
- * For SPARC, the first integral argument to a function will always be in %i0.
- * Horrifically, the value of all the UREG_* constants is off by 1, so we have
- * to correct for that.
- *
- * On error, -1 cast to a uintptr_t is returned, and errno is set.
- */
-uintptr_t
-Pread_first_arg_sparc64(struct ps_prochandle *P)
-{
-	struct pt_regs regs;
-
-	if (getregs_sparc64(P, &regs) == NULL)
-		return (uintptr_t)-1;
-
-	return regs.u_regs[UREG_I0 - 1];
-}
-
-uintptr_t
-Pread_first_arg_sparc32(struct ps_prochandle *P)
-{
-	struct pt_regs32 regs;
-
-	if (getregs_sparc32(P, &regs) == NULL)
-		return (uintptr_t)-1;
-
-	return regs.u_regs[UREG_I0 - 1];
-}
-
-/*
- * Get the address at which we stopped at a breakpoint.  Unlike on x86, no post
- * facto adjustment is required.
- */
-uintptr_t
-Pget_bkpt_ip_sparc64(struct ps_prochandle *P, int expect_esrch)
-{
-	struct pt_regs regs;
-
-	if (getregs_sparc64(P, &regs) == NULL) {
-		if ((errno == ESRCH) && (expect_esrch))
-			return 0;
-		else {
-			_dprintf("Unexpected ptrace (PTRACE_GETREGSET) "
-			    "error: %s\n", strerror(errno));
-			return -1;
-		}
-	}
-
-	return regs.tpc;
-}
-
-/*
- * Reset the instruction pointer address at which the process P is stopped.
- * (Not needed on SPARC.)
- */
-long
-Preset_bkpt_ip_sparc(struct ps_prochandle *P, uintptr_t addr)
-{
-    return 0; /* nothing doing */
-}
-
-/*
- * Get the address at which the temporary breakpoint should be dropped when a
- * breakpoint is hit.
- */
-extern long Pget_next_ip_sparc64(struct ps_prochandle *P, uintptr_t addr)
-{
-	struct pt_regs regs;
-
-	if (getregs_sparc64(P, &regs) == NULL) {
-		_dprintf("Unexpected ptrace (PTRACE_GETREGSET) "
-		    "error: %s\n", strerror(errno));
-		return -1;
-	}
-
-	return regs.tnpc;
-}
diff --git a/libproc/sparc/isadep.h b/libproc/sparc/isadep.h
deleted file mode 100644
index 005e6008..00000000
--- a/libproc/sparc/isadep.h
+++ /dev/null
@@ -1,81 +0,0 @@
-/*
- * Underlying ISA-dependent functions for SPARC and SPARC64.
- */
-
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2013, 2015, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * Not protected against multiple inclusion: this file is included by
- * isadep_dispatch.h repeatedly, at local scope, to get different prototypes and
- * dispatch variables.
- */
-
-#ifdef WANT_FIRST_ARG_DISPATCH
-
-extern	uintptr_t Pread_first_arg_sparc64(struct ps_prochandle *P);
-extern	uintptr_t Pread_first_arg_sparc32(struct ps_prochandle *P);
-
-isa_dispatch_t dispatch[] = {
-    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pread_first_arg_sparc32},
-    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pread_first_arg_sparc64},
-    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pread_first_arg_sparc32},
-    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pread_first_arg_sparc64},
-    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pread_first_arg_sparc32},
-    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pread_first_arg_sparc64}, /* ??? */
-    {0, 0, NULL}};
-
-#endif
-
-#ifdef WANT_GET_BKPT_IP
-
-extern uintptr_t Pget_bkpt_ip_sparc64(struct ps_prochandle *P, int expect_esrch);
-
-/*
- * I hope 32-on-64 traps are treated like 64-on-64 traps.
- */
-
-isa_dispatch_t dispatch[] = {
-    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pget_bkpt_ip_sparc64},
-    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pget_bkpt_ip_sparc64}, /* ??? */
-    {0, 0, NULL}};
-
-#endif
-
-#ifdef WANT_RESET_BKPT_IP
-
-extern	long Preset_bkpt_ip_sparc(struct ps_prochandle *P, uintptr_t addr);
-
-isa_dispatch_t dispatch[] = {
-    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Preset_bkpt_ip_sparc},
-    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Preset_bkpt_ip_sparc}, /* ??? */
-    {0, 0, NULL}};
-
-#endif
-
-#ifdef WANT_GET_NEXT_IP
-
-extern	long Pget_next_ip_sparc64(struct ps_prochandle *P, uintptr_t addr);
-
-isa_dispatch_t dispatch[] = {
-    {B_FALSE, EM_SPARCV9, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_TRUE, EM_SPARCV9, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_FALSE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_TRUE, EM_SPARC32PLUS, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_FALSE, EM_SPARC, (dispatch_fun_t *) Pget_next_ip_sparc64},
-    {B_TRUE, EM_SPARC, (dispatch_fun_t *) Pget_next_ip_sparc64}, /* ??? */
-    {0, 0, NULL}};
-
-#endif
diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
deleted file mode 100755
index 732ae3ca..00000000
--- a/test/stress/fbtsafety/tst.vahole.d
+++ /dev/null
@@ -1,50 +0,0 @@
-#!dtrace -Cs
-
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/* @@skip: nonportable */
-
-/*
- * We set our buffer size absurdly low to prevent a flood of errors that we
- * don't care about.
- */
-#pragma D option bufsize=16
-#pragma D option bufpolicy=ring
-
-fbt:::
-{
-	n++;
-#ifdef __sparc
-	trace(*(int *)0x8000000000000000 ^ rand());
-#else
-	trace(*(int *)(`kernelbase - 1));
-#endif
-}
-
-dtrace:::ERROR
-{
-	err++;
-}
-
-tick-1sec
-/sec++ == 10/
-{
-	exit(2);
-}
-
-END
-/n == 0 || err == 0/
-{
-	exit(1);
-}
-
-END
-/n != 0 && err != 0/
-{
-	exit(0);
-}
diff --git a/test/unittest/aggs/tst.neglquant.d b/test/unittest/aggs/tst.neglquant.d
index c09d7aab..5e6d1dc0 100644
--- a/test/unittest/aggs/tst.neglquant.d
+++ b/test/unittest/aggs/tst.neglquant.d
@@ -90,11 +90,11 @@ BEGIN
 	 * We want to test the ability to sort very large quantizations
 	 * that differ by a small amount.  Ideally, they would differ only
 	 * by 1 -- but that is smaller than the precision of long doubles of
-	 * this magnitude on x86.  To assure that the same test works on x86
-	 * just as it does on SPARC, we pick a value that is just larger than
-	 * the precision at this magnitude.  It should go without saying that
-	 * this robustness on new ISAs very much depends on the precision
-	 * of the long double representation.
+	 * this magnitude on x86_64.  To assure that the same test works for
+	 * the architectures DTrace is developed for, we pick a value that is
+	 * just larger than the precision at this magnitude.  It should go
+	 * without saying that this robustness on new ISAs very much depends on
+	 * the precision of the long double representation.
 	 */
 	this->val = (((long long) 1) << 63) - 7;
 
diff --git a/test/unittest/arrays/tst.uregsarray.sparc64.d b/test/unittest/arrays/tst.uregsarray.sparc64.d
deleted file mode 100644
index 2179a0db..00000000
--- a/test/unittest/arrays/tst.uregsarray.sparc64.d
+++ /dev/null
@@ -1,69 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-/* @@xfail: dtv2 */
-
-/*
- * ASSERTION:
- *	Positive test to make sure that we can invoke sparc
- *	ureg[] aliases.
- *
- * SECTION: User Process Tracing/uregs Array
- *
- * NOTES: This test does no verification - the value of the output
- *	is not deterministic.
- */
-
-#pragma D option quiet
-
-BEGIN
-{
-	printf("R_G0 = 0x%x\n", uregs[R_G0]);
-	printf("R_G1 = 0x%x\n", uregs[R_G1]);
-	printf("R_G2 = 0x%x\n", uregs[R_G2]);
-	printf("R_G3 = 0x%x\n", uregs[R_G3]);
-	printf("R_G4 = 0x%x\n", uregs[R_G4]);
-	printf("R_G5 = 0x%x\n", uregs[R_G5]);
-	printf("R_G6 = 0x%x\n", uregs[R_G6]);
-	printf("R_G7 = 0x%x\n", uregs[R_G7]);
-	printf("R_O0 = 0x%x\n", uregs[R_O0]);
-	printf("R_O1 = 0x%x\n", uregs[R_O1]);
-	printf("R_O2 = 0x%x\n", uregs[R_O2]);
-	printf("R_O3 = 0x%x\n", uregs[R_O3]);
-	printf("R_O4 = 0x%x\n", uregs[R_O4]);
-	printf("R_O5 = 0x%x\n", uregs[R_O5]);
-	printf("R_O6 = 0x%x\n", uregs[R_O6]);
-	printf("R_O7 = 0x%x\n", uregs[R_O7]);
-	printf("R_L0 = 0x%x\n", uregs[R_L0]);
-	printf("R_L1 = 0x%x\n", uregs[R_L1]);
-	printf("R_L2 = 0x%x\n", uregs[R_L2]);
-	printf("R_L3 = 0x%x\n", uregs[R_L3]);
-	printf("R_L4 = 0x%x\n", uregs[R_L4]);
-	printf("R_L5 = 0x%x\n", uregs[R_L5]);
-	printf("R_L6 = 0x%x\n", uregs[R_L6]);
-	printf("R_L7 = 0x%x\n", uregs[R_L7]);
-	printf("R_I0 = 0x%x\n", uregs[R_I0]);
-	printf("R_I1 = 0x%x\n", uregs[R_I1]);
-	printf("R_I2 = 0x%x\n", uregs[R_I2]);
-	printf("R_I3 = 0x%x\n", uregs[R_I3]);
-	printf("R_I4 = 0x%x\n", uregs[R_I4]);
-	printf("R_I5 = 0x%x\n", uregs[R_I5]);
-	printf("R_I6 = 0x%x\n", uregs[R_I6]);
-	printf("R_I7 = 0x%x\n", uregs[R_I7]);
-	printf("R_CCR = 0x%x\n", uregs[R_CCR]);
-	printf("R_PC = 0x%x\n", uregs[R_PC]);
-	printf("R_NPC = 0x%x\n", uregs[R_NPC]);
-	printf("R_Y = 0x%x\n", uregs[R_Y]);
-	printf("R_ASI = 0x%x\n", uregs[R_ASI]);
-	printf("R_FPRS = 0x%x\n", uregs[R_FPRS]);
-	exit(0);
-}
-
-ERROR
-{
-	printf("uregs access failed.\n");
-	exit(1);
-}
diff --git a/test/unittest/arrays/tst.uregsarray.sparc64.x b/test/unittest/arrays/tst.uregsarray.sparc64.x
deleted file mode 100755
index 2c34e04d..00000000
--- a/test/unittest/arrays/tst.uregsarray.sparc64.x
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-
-[ `uname -m` = "sparc64" ] && exit 0
-exit 2
diff --git a/test/unittest/pid/test.sparc64.options b/test/unittest/pid/test.sparc64.options
deleted file mode 100644
index 9e81427e..00000000
--- a/test/unittest/pid/test.sparc64.options
+++ /dev/null
@@ -1 +0,0 @@
-@@skip: pid provider not yet implemented (sparc64)
diff --git a/test/unittest/usdt/tst.enabled2.sh b/test/unittest/usdt/tst.enabled2.sh
index b174ef4c..c33bca07 100755
--- a/test/unittest/usdt/tst.enabled2.sh
+++ b/test/unittest/usdt/tst.enabled2.sh
@@ -5,7 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# This test is primarily intended to verify a fix for SPARC, but there's no
+# This test was primarily developed to verify a fix for SPARC, but there's no
 # harm in running it on other platforms. Here, we verify that is-enabled
 # probes don't interfere with return values from previously invoked functions.
 
-- 
2.51.0

