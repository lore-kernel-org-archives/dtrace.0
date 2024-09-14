Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A9B1D0DC9
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726336657; cv=fail; b=sDeCUiyqe74snhbyPXo6CDcqhGDMlQoXMHks7L7ZlnhYGkIB8rRumiFPCkbiDfesd643pmUMAKsnKZCL5Bo5EUQd8aZrhEshbeO7PeLjl1A9GY6zJb6WMsRgmE8Ebv7vsGKtk9kklkf58pKN18pZImNdExdwESTAjXmY7DO7hNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726336657; c=relaxed/simple;
	bh=aHLQVvvTqyR23dY8IQn6HzbRMMfxy3tsoRH1w/jCKO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f3ey6o+nF7LyVv2b84N6h4HDhUQcK7MYfrEize2iawra63WJyoeN/5hIJ6LY6pc1uDBawnWZ89vCou1P12RRNs/YPPHvyRUxzE7esE2POqYauXdbVJRn563HGw6WAbI+HtRnP39Aj1b6O5ktITmBK3pdF6QGAoG+CMxrvkS2OBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XON3gRmK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YozdefN2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XON3gRmK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YozdefN2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EAF57j027265
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=x++iJFGwj4Qrjj4
	szMZOnTS6Ru3PhQf22UxKLhDOQfA=; b=XON3gRmKgmI3SViitKIt2D0O3HzwtaY
	e9UU0RlQkzq0SqTK9dBd9vINhaZ7yCsgxykGqp9eBPMzso29BpnQ01vRi2HYupfq
	+I/k901aif9rzJKOUMlyCatUA5KhKB7d+nGII+XcGD7MFYYJg69nlCeFUhjL2iTv
	KcCt1EB9w+UumLbkfydfT16J6ylURiRNJ83j99rreedev2xzpE5IggbUqI3LmJ0U
	tQHLtxrb9WhXsoY18ASAVR2GvHVjBaYzZeBtV1ZZ2en3TefcHH8Nm7sh3D1rx1jM
	fyTpSiDy4RK8/DRI7Jw6hHu6nf5rUwfbFEeim7BGIGEvUg+c/D7rBEQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3nfgm6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:57:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEMCBH034668
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:57:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41n0xcnpeg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 17:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hidYVDZ6MXd0dycG5Ab63tGnBYJZNJGAX3h6fACQzu7pQyX68y6b8BCsfya6T3rb2zaIG9ETaU0R2/pn8c4S5qII+UY7PBOugOEXu7AlW5Y237Cq+twap6lJAGPX7g49lhUIDXhghZUbPQMRA8O/GJlCqxzcOIzWWC4jBmttplvl7evI9l5bqFGhrXpHznfdBnVi/2Ttc0g3iVoKvbvgWVY/AH8efAti8eToshEU8jIDq9/8lPaNYGsoi6g6B/hlLsu7Hk6XLQqDMgZZ/BoQJ5YadAa04lLv3qoJ7qsmaTEhKmW+YFkVRfZx8G4gx8TyxwM1CuKYfntwT/PVPhMA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x++iJFGwj4Qrjj4szMZOnTS6Ru3PhQf22UxKLhDOQfA=;
 b=vYI7j0X8V2z+ICZG/sYus+6PE/zEAL4eqvay+2jp+J172oQypMB1+ebKHxH5YN2SJjefUt2GI/cF6s9VkO/SFXSAMNdWghwp8rY/j3IDZQT1W2TFTFwSqkW6kssVJzFqYVvipcfQFT8aRaSVf0/3pGdS7JKck0njwg+GQgi6QJKLq5CXFYBsEUX3hCfF4exmC0bS0HB7SwVbP3WcwtJ5GL3TosQDYyWOnU2Rcc6SK5LWBeaDFkd2yxMuTeJIyixe8+U1jc3O5xlJnzGvnMRTvi3wULuP1fLAMKuQ/sv8iaSFrzsgjio3pm4Xq4tWo5VjCgAJ9zm+c6zf7n0EREXXgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x++iJFGwj4Qrjj4szMZOnTS6Ru3PhQf22UxKLhDOQfA=;
 b=YozdefN2JZvrx55A9tJxR8USqzlQNUwIaySPVhg3czbKwB0Z0J5m5KaFJx21wCWuDUbkWdJ+LvIO8629+DOrVfXsj5A8+T4mAeNEMERlSYFzStzZjDnwsy6EkpYYS4ZiC9RO3zS+26yQnPZpLAXlnbvlIiJRZPXGvRKJMjk6JmE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4733.namprd10.prod.outlook.com (2603:10b6:a03:2ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 17:57:24 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.011; Sat, 14 Sep 2024
 17:57:20 +0000
Date: Sat, 14 Sep 2024 13:57:15 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/22] test: Clean up the specsize tests
Message-ID: <ZuXOeyBUMH/igYBW@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-15-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-15-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0076.namprd03.prod.outlook.com
 (2603:10b6:408:fc::21) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4733:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c649e94-260f-4383-e15d-08dcd4e6ac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HS3x++FnCE9ELP9I0bu3t3adxpCieZfMjDYO+cmV9N3bf4RIttPiXoX1zRuf?=
 =?us-ascii?Q?4LFwlJk4VB2BBtH7Zg4VHp3pZh97Bx6QXI8MTe1+1M8xINDKdia7cXWiqrLC?=
 =?us-ascii?Q?t9aHZ1W31GJAwDJAyrF6rvE49JPIK5iQROD4vdBlXB3ZvU59/N2aLBVBbzPU?=
 =?us-ascii?Q?0mIZkW+cH/NTJZ6sRFpxdbSgBr5nSXdAtWNSzyjvPivdb2OytooqRkhI1pyu?=
 =?us-ascii?Q?2S6Yft7lBEcfjRkhERmEoIrmsOYDkJ6loSpjnXWYwP4ZM+YDQOBot8JjgsgX?=
 =?us-ascii?Q?1uGbgBEGmijsrmjnUmRFB1hDmXfy7fgpjIZbuEzkdyqppfuELeBsHOKIV7xM?=
 =?us-ascii?Q?mZ41cK2+gBJuO1sFrTqnPP/8v+zPq8M3av2jijCyLl5Yzpan27oiornMFJZJ?=
 =?us-ascii?Q?MgvapeA7ZYIQ6gLa4WAB//NrHgxpM8HwqFhQfJ3Fuylw2BpzRQsxGWaTQv2U?=
 =?us-ascii?Q?8VMfRJ5XM2JasYVqyJhU7f3x1xzpfARvVFaokRM+hgGLb0kGbZTm0tvHvKG0?=
 =?us-ascii?Q?dRkB+dMKlazPotg1aPGH2uhyfGXsoo2QBh4qNmxV311k7anAWt+6Q8edhaGj?=
 =?us-ascii?Q?ifahQVx3esb3sHM6oh/JdVZ85bx8MAClUT+Idejfn8llbVPlia7X9zgcL1zP?=
 =?us-ascii?Q?5UhAn6tqyJ7OmXyBlf79XZtSbEbnp6jWGVWckZcA3Cn9bBraMOItMPTCBP7S?=
 =?us-ascii?Q?Y2lq/ERup2VWpqckxZjPfzQYs1UXmXz78IFqYHrjbMKWOXgIKVRdVjOtD1/q?=
 =?us-ascii?Q?5peihpiVepyaq9D08gKjnGPdiWhBjQCupHZtQvnPIOFH+WtEzruF8LqmIWag?=
 =?us-ascii?Q?G0+ySfu3sHC+kejvR5jVuaEueIQgOKfcI2W1unA3b/kPihn0It7QRLSPEvpk?=
 =?us-ascii?Q?KI9e1jGZWCE86s7TwLKOi6cqxTRpOXwhuEI+QgAvap1SVtrRyRBhW/tAQxjR?=
 =?us-ascii?Q?gUBEB85eAOM9OHmHut2bQoQ/YewdfhRY4WK8OdjAPuHDXoMB1+Rg9iPaJZwh?=
 =?us-ascii?Q?AeeN4BK2zAU7X+kD5rdJyaV6UZO9jaQFmS2JMQqqP68EzMuYQcBkO07FKp9O?=
 =?us-ascii?Q?Vcw1WkGWYSXzuZCO3vbbJ9/mh3gqgI8EeudA7YO4bTNnZgOggVESL/zT2YUU?=
 =?us-ascii?Q?FkW6G+AwzbahK8Z/E9QXzvAXRWReDOtQXrXo15uUwRBF0z6Fa+lT3MlrJfbC?=
 =?us-ascii?Q?flB/L6LXkVKRRMyq1OXnlNRolLjmpy4KqmLhy0yPa6mTPmdTkQeINwa2QKd9?=
 =?us-ascii?Q?dDsasA+m3GZiFCRYXe3LEhPUcLIiGR6LRBE3baXlxkAp0NFlsfAurA3nzTIK?=
 =?us-ascii?Q?rZYICUFy+t3KWDPgvFqbIAjOxXHw06Y3rEtEfeV1yWAI4Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6v0rLIjzLhCH1KHDylIxy0ThQ+Tilf3H4EQIMRqquu8qlgDGcbDS/jZ3MV2d?=
 =?us-ascii?Q?uYoPxano2ZES8Jc9huKGfYzVdY2XYXPZrpS+PXXT4fFqO+ESutNowGI68BlN?=
 =?us-ascii?Q?nOXGTI90YfsBRNhkgKD3kynDzoma6HzTN8z8M8MZR59OCTin70Jh55VTTtLb?=
 =?us-ascii?Q?y0Sqyd7tzNMvcBIqbIQf00UAdUjykUgGRQGsJ5UXqStQHi/ba6CPCkZDER3m?=
 =?us-ascii?Q?FrhxHIrGvqZmDCgHNVP77jwRIDboiHKMLk6ceA5McoVtSql93uSW2MzecYxk?=
 =?us-ascii?Q?HvYaG8+vozW0A7YXqBakXoQ1bA6qOmAtm038rxWv7S4PmCduL4snSofMv+hx?=
 =?us-ascii?Q?du+8Fn14+mCazVo9Hv8m8WuTfovNpanAMFPdP2jQg/KD4vq1lJeeE52XxNTw?=
 =?us-ascii?Q?orYLOcLoNyZSGIjmFLMr+C4dFyiVHFpgyecVT+vsOjyTJ1FYAH5hRw2OUrAx?=
 =?us-ascii?Q?WTCzS9/IzhTRbCTnxl4zuSGyKaUNEgVFczmC5nfxyj3iDyAkc6YieMfCk3M2?=
 =?us-ascii?Q?sM+3+G46NAMrjFKoMJUyHru/1F7OzY5cLnywrVzCRTUJ9jerta/NnxObq3Ae?=
 =?us-ascii?Q?UKXEAiTxuQec2g1lDG4U8W4a+hAUtor4h3/aXUBBAMzemQobM07P1iLLj51q?=
 =?us-ascii?Q?gH9SXL+OOjI+UA5a75tcsROnRWs7bf60L28t9H7fE60/MM7L1rXNbvFOAGKM?=
 =?us-ascii?Q?IQOCF8ZXbpWPPlPbXhu6NF+UEoaYbFv95p6yL7yq739rUSntBW6OUygYf3y3?=
 =?us-ascii?Q?wm6Mlyj9ySW8DqBLCUxCvCthvr38XcwQgUwd0XqB+2/bDXqVWUcqG9PBeL6X?=
 =?us-ascii?Q?ilPBsVMsELzHt7ffVA5Dn0Ipbodty3JVe3hLDX5CG7w9DDBjBnCKuXjmsf9p?=
 =?us-ascii?Q?ZjfUy4JoiuOaxna7VMKIBtC83frUH9z1puWRWE1yaXd6n3mztQIqYX/JW6m3?=
 =?us-ascii?Q?y/3oUl1sZzSee5khcFoNo+42sU7J99TNtw3452o3w14SCU1JBHsnz88L03FS?=
 =?us-ascii?Q?ZmUFAG1s2j6McJ8b9wnWUDVANnEXJrKu6nq12qtxrnjlgNCmkcsqcx+f9nZu?=
 =?us-ascii?Q?5MmeJF0TgTGiGYQtFXwYKP0CTdW+zcMYPcuHhJBxpOZSRDDCccq4xesDhR5r?=
 =?us-ascii?Q?oGEZgkff/Mk2s/qu8/505eLftGQVdEbTc/Abqo9oP9roH4Gg19DCDhut2J+H?=
 =?us-ascii?Q?u8OKa61QOdMygC4fmz8HsIwlJZEzeMqUId6It6V261fhf5XEYxAfZz155EF8?=
 =?us-ascii?Q?ea9WItm9jpcPsczSl1opUtaRX8beJ8mvPwj0tBBURQUHkHKKBbnk6BISkW+M?=
 =?us-ascii?Q?WeRB+XI3kX1hIZIXHGlIuGkojST//x1719dy6B/nzvWdBzb4bD85uHtbPaSG?=
 =?us-ascii?Q?35sEoOfXrMFLpNWcNbzNQmz+Sspstu25a95yyEvO7/WmoI/gD8VGGdrhOdRY?=
 =?us-ascii?Q?JKe1dSGkF+PkW1BRUtPzMDGJQKYvv5jlUzLfkN4MIdg5/cJNDlHEuWbMA90G?=
 =?us-ascii?Q?9Ukg6/Zm83pXobmNjfQdH9KfxQZLZd6bU0JPtSzthS7Q1YRjM2ZbBe8mVO+3?=
 =?us-ascii?Q?Q8rSXggltzcMTTZ+oN5zEzNM+gtMb2G0Qdr2CKhmJwslNBBAJ36uNc8S031E?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BDwDpW2do1bZBOu7nP/KFDOKfdZxHhfsjwUSu5sJfqpaKc31KefG0AUzVklSgy5zlRa01n2BmMLzDa0bf1oCmcqtXxS2jV3kvC/ONIRu2pWSabvzbdVSaLJG3bOYX3ONUYk20MHOx44FiNikS0nO47wVY1iPxdwpT6c4vmS5cD/fleVCF/GKwVgbWCESsbXz76tqhl3b5PYJ1Eu6YtaYvLEI24Utjw9JhJNGF+zZYzXuEZx8cpkgZmh0BTfcRIRpULt+XnTXrNpZbgT0TmCPRfiYQCnn1dPEVjQAYTrkIXNEL0oTYhCfJcUov1W4r4fp1kKSk0awWbBmYe0adzk6NM4DJv9ZQEHs5N73nhobNnHPzu6NqjODBGgtz2bqKWUAzKW7kWjqBV8cIM7JHQ8ZchZs33Z/lS7LpNqxovBDVHZoODnlC+w59SFrWyN5AKys4GAMRtlr1Vwr1TEDLh+A8M+V1fKSX8FgWwURipv+kEIwRN/PyQFUhPBcbrOv7ml5H50+G+6jEZtuK9QHy6kGx4h3ua7cyQczm2aWnNTpY5jUzqbLrt1arApj0Up2kA/UgpX5Xzc07TRJkKMN5zGmQtTEjw5BrnsCVH19dbgKKW8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c649e94-260f-4383-e15d-08dcd4e6ac8b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 17:57:19.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0SwL3MV6r7HPwg1ikz1Suma9TD/ZDg6VCgxszCGGDiXm3RYZzSJpeE/gMToBdOQiwiYK0gxurcE03gZBmWa7aJukW7D3cU9i2zCnp86Tlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4733
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140126
X-Proofpoint-GUID: dGgaf_7LSs2jOwDQZA9hcNgjmifwPxui
X-Proofpoint-ORIG-GUID: dGgaf_7LSs2jOwDQZA9hcNgjmifwPxui

On Thu, Aug 29, 2024 at 01:22:12AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The tests had actions like
>     printf("%lld: Lots of data\n", x);
>     printf("%lld: Has to be crammed into this buffer\n", x);
>     printf("%lld: Until it overflows\n", x);
>     printf("%lld: And causes flops\n", x);
> suggesting that these strings were crowding the buffer, but these
> strings are not passed from producer to consumer at all.
> 
> The tests also only tested one clause per speculation.  It would be
> nice also to test multiple clauses per speculation.
> 
> There is much replicated code from one of the tests to the other, a
> shortcoming that is amplified if we want to test more specsize values,
> which is the case when we test multiple clauses per speculation.
> 
> Therefore, replace the multiple tests with a single test that checks
> multiple clauses per speculation and more values of specsize.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  .../speculation/tst.SpecSizeVariations.r      | 68 +++++++++++++++++
>  .../speculation/tst.SpecSizeVariations.sh     | 74 +++++++++++++++++++
>  .../speculation/tst.SpecSizeVariations4.d     | 66 -----------------
>  .../speculation/tst.SpecSizeVariations4.r     |  5 --
>  .../speculation/tst.SpecSizeVariations5.d     | 61 ---------------
>  .../speculation/tst.SpecSizeVariations5.r     |  7 --
>  6 files changed, 142 insertions(+), 139 deletions(-)
>  create mode 100644 test/unittest/speculation/tst.SpecSizeVariations.r
>  create mode 100755 test/unittest/speculation/tst.SpecSizeVariations.sh
>  delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations4.d
>  delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations4.r
>  delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations5.d
>  delete mode 100644 test/unittest/speculation/tst.SpecSizeVariations5.r
> 
> diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
> new file mode 100644
> index 00000000..51f0596c
> --- /dev/null
> +++ b/test/unittest/speculation/tst.SpecSizeVariations.r
> @@ -0,0 +1,68 @@
> +Speculative buffer ID: 1
> +counts: 0 1
> +
> +Speculative buffer ID: 1
> +123456700
> +123456701
> +123456702
> +123456703
> +123456704
> +123456705
> +123456706
> +counts: 1 1
> +
> +Speculative buffer ID: 1
> +123456700
> +123456701
> +123456702
> +123456703
> +123456704
> +123456705
> +123456706
> +counts: 1 1
> +
> +Speculative buffer ID: 1
> +123456700
> +123456701
> +123456702
> +123456703
> +123456704
> +123456705
> +123456706
> +counts: 2 1
> +
> +Speculative buffer ID: 1
> +123456700
> +123456701
> +123456702
> +123456703
> +123456704
> +123456705
> +123456706
> +counts: 2 1
> +
> +Speculative buffer ID: 1
> +123456700
> +123456701
> +123456702
> +123456703
> +123456704
> +123456705
> +123456706
> +123456800
> +123456801
> +123456802
> +123456803
> +123456804
> +123456805
> +123456806
> +123456807
> +123456808
> +counts: 2 1
> +
> +-- @@stderr --
> +dtrace: 2 speculative drops
> +dtrace: 1 speculative drop
> +dtrace: 1 speculative drop
> +dtrace: 1 speculative drop
> +dtrace: 1 speculative drop
> diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
> new file mode 100755
> index 00000000..75e527d9
> --- /dev/null
> +++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
> @@ -0,0 +1,74 @@
> +#!/bin/bash
> +
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +for x in 63 64 79 80 143 144; do
> +	$dtrace $dt_flags -xspecsize=$x -qn '
> +	BEGIN
> +	{
> +		x = 123456700ll;
> +		self->nspeculate = 0;
> +		self->ncommit = 0;
> +		self->spec = speculation();
> +		printf("Speculative buffer ID: %d\n", self->spec);
> +	}
> +
> +	/* 16 + 7 * 8 = 72 bytes */
> +	BEGIN
> +	{
> +		speculate(self->spec);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		self->nspeculate++;
> +	}
> +
> +	BEGIN
> +	{
> +		x = 123456800ll;
> +	}
> +
> +	/* 16 + 9 * 8 = 88 bytes */
> +	BEGIN
> +	{
> +		speculate(self->spec);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		printf("%lld\n", x++);
> +		self->nspeculate++;
> +	}
> +
> +	BEGIN
> +	{
> +		commit(self->spec);
> +		self->ncommit++;
> +	}
> +
> +	BEGIN
> +	{
> +		printf("counts: %d %d\n", self->nspeculate, self->ncommit);
> +		exit(0);
> +	}
> +
> +	ERROR
> +	{
> +		exit(1);
> +	}'
> +done
> diff --git a/test/unittest/speculation/tst.SpecSizeVariations4.d b/test/unittest/speculation/tst.SpecSizeVariations4.d
> deleted file mode 100644
> index 4221c89e..00000000
> --- a/test/unittest/speculation/tst.SpecSizeVariations4.d
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION:
> - * Verify the behavior of speculations with changes in specsize.
> - *
> - * SECTION: Speculative Tracing/Options and Tuning;
> - *	Options and Tunables/specsize
> - *
> - */
> -
> -#pragma D option quiet
> -#pragma D option specsize=39
> -
> -long long x;
> -
> -BEGIN
> -{
> -	x = 123456789;
> -	self->speculateFlag = 0;
> -	self->commitFlag = 0;
> -	self->spec = speculation();
> -	printf("Speculative buffer ID: %d\n", self->spec);
> -}
> -
> -BEGIN
> -{
> -	speculate(self->spec);
> -	printf("%lld: Lots of data\n", x);
> -	printf("%lld: Has to be crammed into this buffer\n", x);
> -	printf("%lld: Until it overflows\n", x);
> -	printf("%lld: And causes flops\n", x);
> -	self->speculateFlag++;
> -
> -}
> -
> -BEGIN
> -/1 <= self->speculateFlag/
> -{
> -	commit(self->spec);
> -	self->commitFlag++;
> -}
> -
> -BEGIN
> -/1 <= self->commitFlag/
> -{
> -	printf("Statement was executed\n");
> -	exit(1);
> -}
> -
> -BEGIN
> -/1 > self->commitFlag/
> -{
> -	printf("Statement wasn't executed\n");
> -	exit(0);
> -}
> -
> -ERROR
> -{
> -	exit(1);
> -}
> diff --git a/test/unittest/speculation/tst.SpecSizeVariations4.r b/test/unittest/speculation/tst.SpecSizeVariations4.r
> deleted file mode 100644
> index 7c4bb3b7..00000000
> --- a/test/unittest/speculation/tst.SpecSizeVariations4.r
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -Speculative buffer ID: 1
> -Statement wasn't executed
> -
> --- @@stderr --
> -dtrace: 1 speculative drop
> diff --git a/test/unittest/speculation/tst.SpecSizeVariations5.d b/test/unittest/speculation/tst.SpecSizeVariations5.d
> deleted file mode 100644
> index fb71dfed..00000000
> --- a/test/unittest/speculation/tst.SpecSizeVariations5.d
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION:
> - * Verify the behavior of speculations with changes in specsize.
> - *
> - * SECTION: Speculative Tracing/Options and Tuning;
> - *	Options and Tunables/specsize
> - *
> - */
> -
> -#pragma D option quiet
> -#pragma D option specsize=40
> -
> -long long x;
> -
> -BEGIN
> -{
> -	x = 123456789;
> -	self->speculateFlag = 0;
> -	self->commitFlag = 0;
> -	self->spec = speculation();
> -	printf("Speculative buffer ID: %d\n", self->spec);
> -}
> -
> -BEGIN
> -{
> -	speculate(self->spec);
> -	printf("%lld: Lots of data\n", x);
> -	printf("%lld: Has to be crammed into this buffer\n", x);
> -	printf("%lld: Until it overflows\n", x);
> -	printf("%lld: And causes flops\n", x);
> -	self->speculateFlag++;
> -
> -}
> -
> -BEGIN
> -/1 <= self->speculateFlag/
> -{
> -	commit(self->spec);
> -	self->commitFlag++;
> -}
> -
> -BEGIN
> -/1 <= self->commitFlag/
> -{
> -	printf("Statement was executed\n");
> -	exit(0);
> -}
> -
> -BEGIN
> -/1 > self->commitFlag/
> -{
> -	printf("Statement wasn't executed\n");
> -	exit(1);
> -}
> diff --git a/test/unittest/speculation/tst.SpecSizeVariations5.r b/test/unittest/speculation/tst.SpecSizeVariations5.r
> deleted file mode 100644
> index d09013a2..00000000
> --- a/test/unittest/speculation/tst.SpecSizeVariations5.r
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -Speculative buffer ID: 1
> -123456789: Lots of data
> -123456789: Has to be crammed into this buffer
> -123456789: Until it overflows
> -123456789: And causes flops
> -Statement was executed
> -
> -- 
> 2.43.5
> 
