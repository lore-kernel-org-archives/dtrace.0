Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE219CC04
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731340787; cv=fail; b=DXof4hQuUcu8OZYEs4OSzCcxAmr4vm4dyHZ+s6fQgF838huwL/QPvWnt4cyOs0qyr0TtmuhoTRIrP3ufJlUGNs2iQeTTJohYao4BjyWEEzniMRYrrkgAN+/9tSQMONKqZSLBRG4rTMTLE5IrDtCAR9kYNFjZiTJT4nYLqN/yiEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731340787; c=relaxed/simple;
	bh=PZxTOBRL7Ma6QRh4CV7vUyWt7yNVhhWsJLBeT2fgWL0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=dFLpypftzyx6nm44/LxVCarGdUtY67Q6by5RV/Bb4BGMUToNkCw7caSBwkNRPF7IVVqLNlJKcVCtYK7A5VQw6waL98ttNeV4H9gCT7jSwzMeys0OR8+Oqk8ZNrLIs1iFvg3GKy9lShIFuxm7ApCGLeUnhSJ8Ab4K8pObqLaFDuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G5gQSs2i; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rXQRo2gy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G5gQSs2i";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rXQRo2gy"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB9sp2f032374
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=PZxTOBRL7Ma6QRh4CV
	7vUyWt7yNVhhWsJLBeT2fgWL0=; b=G5gQSs2iTI+u/oGUoMU4O04LMospduhXWc
	KIq7zt4+HQMT5wwUnRC1fCweqSntrwcjhEZQKI5Bar+yrY1u7mWl8zth3wV7J6lJ
	L1NJIF3UBTmHCx8sTP8TtAAH0bcIa+8sPmI57VffMxLduHGzt8+fzyLvth47KW34
	TzumvM+J3Xrt89pQlptQK2S5nBc8lUP3DhunFGs/+A1lahFj7618AGuC+NbqQHil
	MpaftlrueGPR9kUEv5Ev9N5P4YIWSXoHJ4z91GKY3OvOf+rY+W2b6WKr1dUIf30M
	arhAH/IwgpnzBrTYBJOdnoRw4kyk4qRXByanrqUBbqQR7IGr+k0A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0nwjt40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABFbqwB021562
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx66xny2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 15:59:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfIn9gbscU7mxlf17pPsFkZUIOvP/u2bt2Hl7SFK3lCDIgVfx7S1fp69tZbmOhvjBF6jCNgupCYBgNirG2m/UBYhhTX7J1tvngwmuFPOCRs8uyBkIqEwX2fp7y1pXhM0TWbH5E+v6tGCEliZno/v9doElnNpIrpRVY+a/mYRFs0+X4QLrJx/Dd8NtQQjrcs4Y5bu3gsqgEUHZWW1vIA+r0iNoImPqCSV9o0HmELEcQyeU+rE/B/bmjku5/E/0r8ecYNefe2sdnULjtE30CMyQ1gft5BT2Z94mkB00tmhJSvmnzxsE7hY0Gr5BplspEks04ML2SouDobpoCjy+Skscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZxTOBRL7Ma6QRh4CV7vUyWt7yNVhhWsJLBeT2fgWL0=;
 b=qnE3iiJLFHxiZnaRjz7ZsSWpkzvWCANCBlxopj4j1xnu92uoc4F0kAeNnz5S3PJqlPDzCgYuER0o6HYlSTAZsEk76oAY9oA1mQYHkZKpr7LcjcOOoEnHjiP4A7MB4FAEBhyXbHq2r1gmOJrYrvuDgCXgmcQ7ZdBMezcp4EAn2ZoGZJyBa4CZ0FncXjFb5FshpEN7XNi/Kl0ibVG7HEDpienj41ajoTnLiOXoX/A/eij1YIRRv3XDKKqnHBZc2YiYgUP5UCTw0aV9qbn5yIaVJqaJmYQAb0kl9aPJf1UClRU1lD2u5G89HerIDa/8ACldIYovRAO9VIIjEhoMQaqjKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZxTOBRL7Ma6QRh4CV7vUyWt7yNVhhWsJLBeT2fgWL0=;
 b=rXQRo2gyC32A5ZDAmdDviad4380Svdn4lMjSGZ/XWbPFOOwj8T6ZPiunRVO4M4oOLyI3s//QdUCDwx00fDsPRAyxG8CdYcxZQ7ur18byypaV0tXKnxshn9Khah370f1JQTmfUP1g2CIQifX2ubE57H3MqcxFq5l4suczstau8M8=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CO1PR10MB4483.namprd10.prod.outlook.com (2603:10b6:303:98::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 15:59:32 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 15:59:32 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] dtprobed: don't chown systemd service files to root
 during install
References: <20241111104646.435193-1-nick.alcock@oracle.com>
Emacs: indefensible, reprehensible, and fully extensible.
Date: Mon, 11 Nov 2024 15:59:29 +0000
In-Reply-To: <20241111104646.435193-1-nick.alcock@oracle.com> (Nick Alcock's
	message of "Mon, 11 Nov 2024 10:46:46 +0000")
Message-ID: <87ikst4v8e.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::18) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CO1PR10MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 38361a1f-5bb9-4c01-0cf1-08dd0269d50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3bm98d6mLFDLMqtaD8UWdFqZE/fGXsED3CwoUhKBgcdDG4woxGbXARoi76Pf?=
 =?us-ascii?Q?RLk5fL47KfDF7LyWurfbFMG0WkUaCt1MtE4zVKFCaDDaX0OQlED88eMZZFuy?=
 =?us-ascii?Q?MptYaiXOpqjpNdCDAER8a+VN968JmiTZIOIm/+Q2ylkP3+wk7sxK8YCPForh?=
 =?us-ascii?Q?AfUJ7095QFfllZJmwab9KKD55PXE+YRhmWdFIwYYKTWRvPknZzzlr7xlpkvu?=
 =?us-ascii?Q?0+RJH/BiLeoLrFF9cSPZQNed36SVDAIANyMINNe8i+bXg03IjChLzC6cAeDg?=
 =?us-ascii?Q?FdbTgHJURLcltUj5dMiO6bFtRDp+WZeXLJthkbwjHtLJ4XXQIBQVEyi+Cx2m?=
 =?us-ascii?Q?7uRdDbursz2ZB8uwVvktisIg47Tjy7gh9SsbrhWhfh17zj1BOrxgB5pAxOus?=
 =?us-ascii?Q?yHU136t5eoJiK3XAGGwEJ3qz8LcZ65gsUoxLboBx3u8yXWw3QJ10TavWABgB?=
 =?us-ascii?Q?Y3nZS9uVZVl6alLgWEIHLELbF/soFTm9XhB9pyzMHoS9EsBOare1N7QLaJ6o?=
 =?us-ascii?Q?hdKdcwL2uEQA/dNmbeZLfypkuxTQjHtXQOwe39+SR9HmWYwAsQ3udh4Z6x56?=
 =?us-ascii?Q?QZHYJe543CF+fu12f5b2DQJxKHvh+1lsjjbxzf//kSfD379QOrM9g5k1yWN2?=
 =?us-ascii?Q?zeckhXmfC18hZgs3MapmS4QK2c9Sfoob52n0GBkiO/aZDxnN/v/50oKSNzs9?=
 =?us-ascii?Q?3C1nsomXYdBmGAV6d0INgNhNbYv54kdn0FNLGg2jOlDMuVAao1cv0rg/tBSg?=
 =?us-ascii?Q?SatkwF5srtrm+V5yu++EdJII4v4Rd2NwK0zxWNWCuFDh19QEjNCBwOIuPXRB?=
 =?us-ascii?Q?UKIXXDPrqBT4lFl/U+qa1BV3uE45XWuS051qUxgc7dtde2SsqA5p5MVxJ/1w?=
 =?us-ascii?Q?we36v6qAc+xXC221wmrUTIO8kDw9DKQDV1Gu2DRXGNcvsOb0SMfNg+YmbCIb?=
 =?us-ascii?Q?gkDann0GaaG2y9GBadnIUKVfAD61aWwfwUYcBBkUf4/r8g/hxXn0PXZZBnNz?=
 =?us-ascii?Q?k3JZ+jfSUDzbwCTPO1x2HHytAyrjIlJcke+6KYDn8LsXlXf5y4ApegolNqZp?=
 =?us-ascii?Q?DEPVxhWhZo1yXo8Zpn7PbMluKGe90j4b7a6/JUoZe67gXO0mSU9X7Q/Dys8+?=
 =?us-ascii?Q?rU/weCQpbMjrrRgYPsK+EwH9n0RDCnPEU+0f+lx0W8BhPGcoai4Od5rToCpr?=
 =?us-ascii?Q?i1Ge5NWTFs9MJVr0WHZnUrclA0kPxxdS1mdpW1qtVPEk3m59rVrpv9Mbyju1?=
 =?us-ascii?Q?n+GCIYk4wLAoHtfanDhr9xcIH7OlI2jfHwox/ietJzxmholgMGe0+7XuFqgk?=
 =?us-ascii?Q?X+A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2HNwREhjLI68u0F0Xuh89gYs8tECBzDN8oC8M4+oVJUyzURFz/9ZgLs9tSOg?=
 =?us-ascii?Q?5ruTqhs8+/qMXCEk4zTxaArMze7j42Zwja+v6hXjhWAm/B7bMXHuv6FCwWxy?=
 =?us-ascii?Q?bMA5CxvqS3p+2P4VTGHwkYmLLYaD3RHCAet4YS9w6XuQkLdor8vJiuVhIA/f?=
 =?us-ascii?Q?HeDGJ6EjaACKAxaYE34mfz6JZZSIKYd5C4BwZGBSgmZ13YZ4ZsFI95nBiKvO?=
 =?us-ascii?Q?0hF8g/Y53YmqfqFy6bdhaBnZnra4EH9ZMclb4gwyoNc5MeBaq7eK4twZrZuf?=
 =?us-ascii?Q?V1rDGwg7p0VYn5G5Vs6HIp5sQFSnhNh7L6sTLaMDk++bKJW08eMqPNG4ACdR?=
 =?us-ascii?Q?X+UO4nmoZrgrqkbWoqAHfOjWF6rSzPn/n5qF9I7PLyr3lNboI7HotiMU4AwI?=
 =?us-ascii?Q?wIzN1gh99eMIf5jkTOXxrIlffFmGvSryKhm65yw3sRgbch3qMCANgbHdSNAV?=
 =?us-ascii?Q?dQjKco5Frrbvyre9QYwqCiPQDmKbV6jE7KtA7f6DVnfX8oKqHLXjVLuQPEir?=
 =?us-ascii?Q?9xW148WEzUlPoqNjP8ckebaA31ttHOOnwX7nEPbMIsxXddRx26BcuiQvN/B9?=
 =?us-ascii?Q?mPinR5ydV27mYQ3t5Vo/3kru30lLJYEA2TAehMDq/681yk99uLdkWbgMT2es?=
 =?us-ascii?Q?FHNFHg9lXVsMqrmPXuZlOsr7FPZm2fb7+zjoU7EPZ7tupBqL5bxgUSpPxLjm?=
 =?us-ascii?Q?GdsELsE7CznuH747ls+Rn1xI6u/8on41rcX8ik6R73wM9j9eBf2IqRVgfaOg?=
 =?us-ascii?Q?w5gcn9gk6sqXDLhkTHMWnSw9+nzdzXWBqpilhcZdu81ldufLr1ovOF0hMtu4?=
 =?us-ascii?Q?ys5CCb2H9Zbtd0liiy71+/Lcf4NvFvlDtCN6GIWxhd6s5VVq02zQhBHvt7UL?=
 =?us-ascii?Q?j/cVhNxZ5WDDBQHTOJo4dWrPlOOcGMRS2D5rFQFrzSllu+v1uwa1AldUOdJ8?=
 =?us-ascii?Q?rDTO52/XmerYDa8egOivWDNLGhBu2/XEmo/T3AbDV38boQHpa10iBKbC5KNd?=
 =?us-ascii?Q?tnNlTklTLJNpPveRm+7Rx7+tz6bg8Hj1q2wPqRTFWUTxyEiV8YlUid7q7OQn?=
 =?us-ascii?Q?b7c6EjpMchz606lI504wwcvJOILtYiHv8QKCaQ5miduUf8QyyXA/f7v8frDi?=
 =?us-ascii?Q?ZfAIX50N3Cd6eR8O/tQF+/pjD3OTxHo7VYfq6yEKSdzal635nLLSO6shfhwK?=
 =?us-ascii?Q?0MzXa4YKcPjQy75//q4ONmCjDwmqNRNYxs8KfbistvHfnertxU95KNtpRQQX?=
 =?us-ascii?Q?+5Pbhj84HFwhn41gQTbSFDOe0nR8iPmjeaMEH4QrqUryPqsnEHdR5JAZH0iz?=
 =?us-ascii?Q?wUpy44/xRgDXF59u0+t1tx7MhJv4KHr/geSnNA/xAA0O84FgOXJbj9GWNxI5?=
 =?us-ascii?Q?GoV4AL3CN2G12fFUuAh4vlp88OlAXZLDceoOvvrULDBZ7P+ehUoJ2PfgfQ56?=
 =?us-ascii?Q?U7s70FvyLejlsK6wmbwKqvgkJg7Zi+WcHKk1XnVqKbfPLcwiEgXa7IHL49BQ?=
 =?us-ascii?Q?1JFVuYX+1WGJjxi49jd1ZcvAxTl+zrAgDJF0eaexzSSWHh4vxbvFr2qbzXH/?=
 =?us-ascii?Q?8wh1OET14XrZ9nfD2cgYMYS7Ha+pe9Bj16tMY/rZMIjEm1m+0gD2dV3rr0tt?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jOoOBk6ITnvbcJ2sPT0TqjnkHl6Jov+59GWZ4U5LAiNQRNNwK4pvRmyk7Fiu/1XIgHd2Dz0lQR4gJU4/L4v6NnpDwLuIm5o3Uz/ZRjQt8mF1NDuo+HJglNnaJPstAQ3o9x7vKuegggtV63maJ/qoda3ikwHYctyacAKFHsZbAyr5PksK9h3wQ+UlhNJDdOriOIk5DqEmn2B2K/lUOw8G79RSk1iA022Sg8ui7wxU6dImAUyh4k6fDkq0P4QlxVz8aDMlMe386wKHt96uY8kc48YYKBXupIZGu4q6x2hiWsuQd4G1OZrYuGAhQDFvS1/9P4qJVwowAfyYdLNFqOD68BR78SS0R4b/6a5vSAyaTOsrgHJ303M9cLCTdp21RbXPRTNDgXBCjrSSNQxANQ9koRo3uz3BZWlL3tA3I5FFf7klfwqCJ4KypV6BoHrtMFRtyr8mNiSHZe3K2/89BG/eWxNbahfLRTJltj2DxO4TIt/kVExfY6vrBcpo4O01Hw0NKdSS+Jz0VqQ0O/vZ9rabM4LiycnxmiHMinww/bPVj3YEMfx0Sf50mSouaS3jpnFzcPfiLIxB0a9+zX17Cl2fACGpIdBgc/31kaJVFqYqfek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38361a1f-5bb9-4c01-0cf1-08dd0269d50f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 15:59:32.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbVBxmgvOomQVqFszMQMhBzYMDLhCA5nWFgUCVqXUtqCNPx8uKZaVu8WxOjfHYTnqmby2tHHRd4vKn8QvZrGiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4483
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=924 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411110131
X-Proofpoint-GUID: XXX03jsSs3qw_TwGfJghVrwy8xRFAMq7
X-Proofpoint-ORIG-GUID: XXX03jsSs3qw_TwGfJghVrwy8xRFAMq7

On 11 Nov 2024, Nick Alcock said:

> I put this in while thinking vaguely that "systemd requires these
> to be root-owned, we're not using install(1) so we should fix that".
> If redirecting, the ownership will be the ownership of the running
> process unless the file already exists (and the thing to do there is
> to rm -f it first, not to chown it afterwards): and if we're not
> root, chowning isn't going to work anyway (and will abort the
> install).
>
> So take the chown out and replace it with an rm -f in the right place.

Patch withdrawn: Kris's patch is better.
