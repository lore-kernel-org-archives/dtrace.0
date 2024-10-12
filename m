Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF1E1799F
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703801; cv=fail; b=cWxIXzZWq1dmmrY78m/PeGGZXk8PUSG9/2fX+QJssC7KPyuD7tfu+IGp5qtvt3Aihd5euwAXq6Kdspr/oCBFola7Aivz7lSzg7Y38GvPAC8XdUJ08oWKHT4wdqkHXiqPta07XeIPCv9HzxXvUyq10bCt4VR6/KQVjxDF5EALy/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703801; c=relaxed/simple;
	bh=JT7XPHKJ3oIi3Y/dmL0BZi3qiVr1mDcm68Cc/tP7A5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TCs0dHjal8N8K5mL1AyjFQoesTlZjyf7CBT4jj8imdQQ5WxSv4PVIaTaFxF60vzZe9ZG0X7K/GTIf06O7q0PY63kflWdz4HfhIFpTRHDBcD5nM4TqUQh4sZ3WZeXJcUI+UtYdFqO8VhP4P6SWbsJafvFyN8QJYvELe2p0d1d8TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZrQyONIq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=n7LRXAAO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZrQyONIq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="n7LRXAAO"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C3PjxD029383;
	Sat, 12 Oct 2024 03:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=NF815OrgR8jcASgdvS
	MTvxJqtV8uK5LsOnUkXnjtLFc=; b=ZrQyONIqNOS56jts6ygV0BdJMLKoxgCsDU
	LWqQMff04RaAcQH93jAUVKXbAZF99ArLZgUdc6fnXZdwVjI0s9OVPKl1rJ6hyJhL
	apfUB87dhnoio3Mz+4HEie+Rri0qJ4+h43e8hZ8kSyYyAwFibOLhA3oLUPRA4Ssi
	m0+ILVuFG0hEXq+t2Gep9PJRqnQg6sVU2yye0D3OsH7VroLqz+zTwGnj5eXlu+Nt
	xC3EB1XFLbzjfqGs/MK5sSSrs5uLJFb8RFy93FLMJSTZqQA5VK7orHUjcO8NLY4R
	jxs8Bn9hJzeoMUy+7cJWFx4NS6AL62Qa/nI5cr46jfj1iPwdCLhg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5c804b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:29:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XhWe027143;
	Sat, 12 Oct 2024 03:29:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjasmpd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aD9FRG2Kou3gwUnMuZiZb/ceTZJpg5Pa044zT4M/IuwvTyu8w9/yEsUljbkt6GOzPu64D6wiVuJUnzAZcoWA5ayDobidOZ44Y1bD4G0zpmhuAqaaezsE5hEEXB8byKcwxjVwB4fNjZgnmLn1vf6fcdv/cIDR/KBaviin4cNjB3yFnfR0wfDK1bK2P1lTzxqdvrA14DsVV8GGudlSlRSpDIwbp1Gd1LCAZUapWCBMNbFzc6EskEg4kwSYR0asBpRI5pmoJ3YLuSENF60KF6jRz+EryB4UH/UmsovkgcGjyMJXhOjJPdZ14mYw3fSSND1XwXD44Ho6qHc0hRaXjXlIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF815OrgR8jcASgdvSMTvxJqtV8uK5LsOnUkXnjtLFc=;
 b=uUlpwmmXR7roU9ja6V6gKafJX5dJnJ4AOuh8OBlT6R/VVw7mMx1ScUdTBpum2axQEt4O//7Kd55jrIESLx9oI+s/ZDUktXeyK60lejo9rFBZSy2tb1aEnsOYPqefXohGqbUE1f3vRU3GWF+0XQG7Z9UyyAlfP037L9MZ1Udsrs/uYYBdInqskXkYoxIL1jwE3n20633JbFMrhzggKgInyj+aAbg+QS3Kvw7DR0ZUnsiARXvkif/v8J3A84I8Qa1sbwLZivC6oj7JLqUzueeT02wpJFv9uQFbTT0AkikCONJMsPJ66OhCHwUjbu86w+EApQ6s5wls2+p5Btr9NWtzDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF815OrgR8jcASgdvSMTvxJqtV8uK5LsOnUkXnjtLFc=;
 b=n7LRXAAOj7baS4eGwTdhcn9/8IDj31n8ieV7vaO/qnkEyXDU1zd+1Tqz3SXYrnxv3jRFsl5hQLhbtqwi/pCSJI8wuVKYYvXqZDaMpysdzKNZz4OzcJmGhjIn4hA9S1VW9BlO/3U571ogW+S1UaclCeWeceYe0YJl9Y4bcnPVK1o=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 03:29:54 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:29:54 +0000
Date: Fri, 11 Oct 2024 23:29:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 1/6] test: fix missing line continuation in
 tst.perf-types.sh
Message-ID: <ZwntMF0m7h5bNwvN@oracle.com>
References: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
X-ClientProxiedBy: BN1PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:408:e0::30) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 22341a93-e607-48d2-61e8-08dcea6e23b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lFhXhW391CDmnPS0sRoRTU4q0a7zql9vFWUmm1xorURSj5zd+SbbUVeTIoTj?=
 =?us-ascii?Q?mxi3LqN0oN6uOR3eEVwhBD2cdVFCfWQV7ZngEsj76IatQjY+na8QrLgAbJMD?=
 =?us-ascii?Q?0sgoZKmWmKno6B1Vm7FfsSnFZPvRDTI3RKToQZ6FBVbtnkYfWTMh+FvOr2BS?=
 =?us-ascii?Q?+iqClG6tpcBmRdxjiPnaO+/EEdO/3st4VyQ72Xkw8L+SvW8EwBRFicDik+hh?=
 =?us-ascii?Q?fkkTzwb/5nNVsn1x9MdaqdYN3tUy/SYQuAe305hCepNtgGzPVQhp1GdBHxgk?=
 =?us-ascii?Q?Gv5Jhd8GQIolB3daO3tshHn2f+pGPWoT6Ag/asi4BaZNZoQWkhn0nQUglBky?=
 =?us-ascii?Q?Y3kOg5zqqoQsd/JV7r4JF2ue0lmSOCqap2bb/L1UKxRS10xT/+qt8zgFOTqV?=
 =?us-ascii?Q?5Y9BURnXZOI0BLLXJkLlBcJLgRfIMmW51NWSJux0q3M8f9mCPRAXcxK6holr?=
 =?us-ascii?Q?UGlqUpV3/qqLE1NDNtmsDocZYsVPhWAkvWVkVAXmyUw1k5Fs3S99hJgfPSrp?=
 =?us-ascii?Q?dx0pa8nSOopwJULYhJm6GP+uD6QKxl/9tJkEniQ19EaOXIEZhFyDDL6/gu26?=
 =?us-ascii?Q?nbjuPUdnKZdiDpMXQWkBGxRJYE7ShcgRtl7288pKk3dPYT0PX61IXitI3ESX?=
 =?us-ascii?Q?pD6ObP3kO+rj+MJl7Pcl4FZn0nrwiGIB20JK58ZwEPc77VWpe5cKIn2CAaEX?=
 =?us-ascii?Q?a8Dqu9MtTCZ//eucDfnMR8W26FgJUattZKBp891qDNaJuPOXxNZ3PILvq0PA?=
 =?us-ascii?Q?NI7ROuObFbXhbG90ABIZp/zwhbdo1deI90liSYgF70s89ZGHLUHNsMfAhyoS?=
 =?us-ascii?Q?h08APWgg2BgcVtD4hGkm2AtevvK2ghnOFHcYrv241H4ZukhEclifPfMXwl+S?=
 =?us-ascii?Q?7VAItVdhc6aVMSSsH2Tlqz2U+xGnsH7gk+D/s++wIsbUu9xA2t04t3XUkaFC?=
 =?us-ascii?Q?Dxp6tFQwLJJp4ko3ccsA28X4kQPxGgfN46fnhAxZ2yifdrq5eO5y0PJ0Me9M?=
 =?us-ascii?Q?lZpns0OadpD5BUf04JEfNTBSBB38FvcCHtA7oePiT23qvwWIua5837YjLU/K?=
 =?us-ascii?Q?e6nsKPYum3Pwn9niD1wwsx6WfR/cRObL2UmE4d2fXtrI0FGJkaqTaPB82OAl?=
 =?us-ascii?Q?TeLQzGSEPmRXhnkDit5/oqbbMfvgXn5DFWLsLZnPoTJO703pNHFQnUTIkTX/?=
 =?us-ascii?Q?L88UFy1ePS8dldnCl0ZYe66cjsCQw7IZUecIg63QdGYMQ8Wj26BH+z9LLa9s?=
 =?us-ascii?Q?qWqEIinJdMARGyKL1wVAFr8c/EoJDawRsbgOxTgPsA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Itx5biOPmcTZuNHhzvCVDnuu1NsC0Q9hyWd2YNahDw2wDKYO+5/vEQRexY3Q?=
 =?us-ascii?Q?hEafCss53YymlYMlk3T7OwydKP8GordmQI4KXaAm4KUs1QROjZIeJJnn+5OM?=
 =?us-ascii?Q?67omRxVznUERR4WQT+9E9wvmyzDARMPzjTwQDp+eWLrpmPru6PFMcn+sAKzB?=
 =?us-ascii?Q?7DLjTLNXVBjqpV7WHnS5plvfcX2dgBU+8xe9YWUl8ZTi5WrxVPsOebLrElUd?=
 =?us-ascii?Q?HPDmRNqNnzbABqh0wNYc4cgbhLMqteiwyQlEyyHt7qoqbWet6WDhRtXB+PSK?=
 =?us-ascii?Q?aUc3XV+bL/jY8icTCF9JU+aFC6vD39oAU3yYnxgpPLSmY3hWkQJN9dFimM5I?=
 =?us-ascii?Q?VxmC2OIj8IZ7qnhVPD70apcVPhhfjB++TTvt9o2qZdyrtNvhGpB61drAdKti?=
 =?us-ascii?Q?GPdx2bu0CQj26G+q8bikzym+1YnsxfOq6oGZ/Bb2BWiTX6Tf8Je2nWS6XSNG?=
 =?us-ascii?Q?bUuVLiWkZI/8A/mefk0FTM3Ka2sW64y9Ptv95Mhfj0J5irUoMePME9CiJtyj?=
 =?us-ascii?Q?gLs2fbEIsSK9PxSFnr/h052mh1ko6nyNmqNpX1gR++2d2ElvjV36SmDO+/up?=
 =?us-ascii?Q?9Cp5jIdnXo7ago40aE7DjgQp4x0opODW/fTUnt704JwCyPpCKaFfGSjC98UT?=
 =?us-ascii?Q?jpQVsJXdBRbCPbWu75rzNnqbgN/+RGpZtulcI/bKw9c40OpFy5ZwbLTc4cCE?=
 =?us-ascii?Q?hZRARPScQebHpG7Uddc8VWcifxPctPdcgPoZTdBcceiKOxCbhyjmXP+IEv+k?=
 =?us-ascii?Q?VmbY1OdTsRvQt8ctz8NM2PQpSshhhegxKZ3ONAsB12nsajayi/PZHFv1rOYu?=
 =?us-ascii?Q?02l5Y9UY/a7XoQZPmOm6gFyxMSp2CnTowVxYFtSF46J+mEtjp4sbTI20S/xC?=
 =?us-ascii?Q?E5hJhD66gb1fM3yQv7Y+X8uqhtW1SCPciW+HFyW1OjmE9XWiDLm+uxuDzwdx?=
 =?us-ascii?Q?UtMZSxyiI7U3vUqNGL5SOHUxAimzkMu6s0fQec1zD9KsXbvIHAltk0hwEc3R?=
 =?us-ascii?Q?SlY+yLfJ+Fo28IEjvO9Wi9IrQODAkia5J25VkI49BirgVzYjAd3osG/r3AHw?=
 =?us-ascii?Q?gu0bOLgc9EV4wcTnVYCiWs63gy172U9RRvj7gZAwGlOAlqNIBvBj6G/yVaIt?=
 =?us-ascii?Q?3Xge4qBd1dj+9LLpZqFt41d8TRjt68zxC6SwW7eqkZTgEb5mTG7laHHGo5mI?=
 =?us-ascii?Q?mhqPg9bzmrUifzHj4GU5VvCdWfRl3iSRDJ6gQ7bL8QiZH5I6f67wllBgOGyx?=
 =?us-ascii?Q?31szNTCLOMwl5mAV+oONacsIDndWPEokjCE+sKtP1CzpCM4MxsL3cqxFKhSn?=
 =?us-ascii?Q?zgA8VfG0bY/JJIR7fU3zXyu53MSX3M2czmL/JFH3iGAPpnOzRarHH45EmeP2?=
 =?us-ascii?Q?oxYQF/eB8m3rETsUUSZJei1WkMX6mc1nYxmpSt9fv7X5ks/jt6oKplRkqj+K?=
 =?us-ascii?Q?FBfQSzJJr8rEMczktyB+XKKjR1sqV3y992Ln7SdpfiUUwpftn+bSUYJZvrhZ?=
 =?us-ascii?Q?9IcDzrQDTrcevhqqnEf/LVI5Wzk5IioQLYmFwPjGbkZPq2DkXWqJ6RGu//MC?=
 =?us-ascii?Q?WCORV33eHZGaMKCktGSTx4JQSPaWUPcWJSMe4ANXuSYN52OsfpZmcbqyRHoJ?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wK3hw6iifW0KVr03Zg1LnUUeEYYymJ/YSx3Z61QEWmJY6Du2quLcG4xIQ7f4ONaSv7lSMRMcXVwCqgjfngJQvgoR5EmPL58+tOl+1ekhCoktxov/k7mCHpzUnlxpZcOIa68KiVB6eGl6xaFEdSXYtnzprUf6xPNeZdtBfRtgvsHsmdiJIQTYKhCTfTV/mZV+nFpp3rI+LS1pYSWKn05addlabiZL87BQdsJCkIHe33JRmzZ/VAtEDDwvNanqeYjSrnMNzCg4mumENncLiLyKzjR+gczNK81BfBOFpUipbtBNc/MxmlBo/dd+e8hyn2VLLIjnJqS+VCFp5xO83zuaCAcpNtN5MpSeDVTriVGa9gfJbaZxVZ5Fv11aHUabCXPz2Zl/afNdbE6kH45Qe75Z+RDmnFXj1KSCx7XSFuFSuF2WaoitbfPFwMglwl3bnoHobPu4g8CvNSlXAGjeSc0ROCk9PuIyCgiKlu+q80phQR18E3GdjHa4eoR3dS+c7WNSI30WD0VB6wNj8IWKdvhfct4EhPKKydkK0ymjdEYamd1xFLY1C1sxqxFAALqUJ1lbsRP57V5S4se+s0Pgcv8Gblj7GZmc0IPRP9LCglyFkJ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22341a93-e607-48d2-61e8-08dcea6e23b6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:29:54.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0vBFRJ+6HtxLeQkceV4Ygn//swXLBi/6CQ5m5Z3sVWbyBOxRm9BJHKt82X5iMZanUVcn2qQuOiTwLD9t+FoYS2CcmkpcNC0HT3/iUQhOIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410120023
X-Proofpoint-ORIG-GUID: xpIx-UlG3_g8sCAlVqujVDUU9uqnPpQG
X-Proofpoint-GUID: xpIx-UlG3_g8sCAlVqujVDUU9uqnPpQG

On Thu, Aug 29, 2024 at 09:15:41PM +0100, Sam James wrote:
> shellcheck reports:
> ```
> In test/unittest/sdt/tst.perf-types.sh line 14:
>     -n 'END / hitany == 0 / { exit(1); }'
>     ^-- SC2215 (warning): This flag is used as a command name. Bad line break or missing [ .. ]?
> ```
> 
> Add the missing '\'.

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and committed with Signed-off-by added.

> ---
>  test/unittest/sdt/tst.perf-types.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/sdt/tst.perf-types.sh b/test/unittest/sdt/tst.perf-types.sh
> index 636ed029..2b076110 100755
> --- a/test/unittest/sdt/tst.perf-types.sh
> +++ b/test/unittest/sdt/tst.perf-types.sh
> @@ -10,5 +10,5 @@
>  dtrace=$1
>  
>  exec $dtrace $dt_flags -c "find /dev/dtrace -exec /bin/true ;" \
> -    -n 'perf:::sched_process_fork { trace(args[0]->pid); trace (args[1]->pid); hitany = 1; }'
> +    -n 'perf:::sched_process_fork { trace(args[0]->pid); trace (args[1]->pid); hitany = 1; }' \
>      -n 'END / hitany == 0 / { exit(1); }'
> 
> base-commit: 98848d2e4994e916317db3328dc560128235791a
> -- 
> 2.46.0
> 
