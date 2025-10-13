Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783402D323D
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760383267; cv=fail; b=X9xgT5TNTvTW3/+RtASLt6I/JVJnI9N7TQBzBC8HgkrZayTMJ4l7VW1JnOLXu/kcMoAuwqwf5CRpWa3UCj87YCdzVkU/t2QpI1SCTnbCBKDL7Hl6NwhBsrz/WJAG5JxDE+esNY5FBffxcUz9JmLPMXtAojgSaWP/WjS8p4uIHv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760383267; c=relaxed/simple;
	bh=cvQg4IQhHOje7bHckU2VR0MZL2fXqccbSxib+F14uMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kWwWG1qqBWQRqz8edDYLxou9h8EGJfzWWazvhSxEjFnFnbKp2V5yMaRptAT6iDNr/7Sxh4zt3dbgXJXMKOa5oSMg25+qnrP6YLIDitm7YMhessblMfdBKdaMk7Dt9Urrq5JhXJOfrcJawC/bTcJFuKPwSGhSAMrTxfUTgQlpex4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=otqGvtj0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YlEBKQG5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="otqGvtj0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YlEBKQG5"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DFu1Xd015418
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=l8nGYFo+suMVzUKDLS
	w7PBKQvNmg4Xi5j34+11ymwZg=; b=otqGvtj086oUSUJXlGU203Q5E5nCRupkDv
	TXlQFO7AxN6GyGAoxKasxnILiIXUJ7dLrkoekg11aGJqbBY9axEA0sw+LybcpFBm
	xTsV5oiiKV1u7muvXpdZf43gi1amqRj/ATfbSZq/A+Rt/Ry8iNEmS/BOFQOcbqKo
	jSR8XPKh9kjkGvV56Qq8j+Lu59oLLTMYuCEyrDCGRGh1z4AJP8U8aSXaPHcbZb9C
	IKzcO9gyaO85YW1A1N3kp7SFfFRnXd882ShUykdrDmJ/WG+CsUhUI92L5d0eW92O
	c+7mHNwBf0odLW7u3zKClBZOkSkPIC9ac7V50BFklgDqPdAnhdUQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdnc2x0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:21:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHZ9nK017446
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:21:03 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp7qm0v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QT3b2+OvgGJ8GO11D7lSQNra/rjDZzfeYyFZdhRTQqJG8Mo6HdL47rIY9iLpku+/7i5b8zteOS2/h/it2I2B4K65I1+ZkSYNNYle+ExV/IfnK38nF9Vv5wYYeiNFiCoVRG8G7QlFdDwrJOuPdliBaukl3KMgc06tF+hi3OBKYitsXNB0tOo9TiizxzQzQbF0dCddSnrP+V/eZCm24Ew+0xccGlkD6uIkcZN/kx6LWLuCQqqAOINBW2ofhJpx/r23TCqUBhEkw4XIQsS2ol10RdK+OqQyawPKXAnnNWvTbjGtLaRaehKQRf4CzP2yHbM2Em4HNIJnXTGB3bUs9qGSGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8nGYFo+suMVzUKDLSw7PBKQvNmg4Xi5j34+11ymwZg=;
 b=uzK35olTG1dxiuerv101TNCCG7FBMB7h9lMj4hNYm1TRkFD9tSEknCfpQo9pN7Y5f+BwIF/KljMEvHrCkuz7RdA+TsvW7acyAL26F3QewFoZVmtS7vcNZ9Uu+PN6ykCKGD92sOguhHRIqDDMZnuXrUxORZAq0RaBAXZ6NUzlDsYFU+/f/nDrFE6d0gBMd5gl9MrfuSUH674SNQF15RccWt0zWC0DFHxqM/+aqzcdDmx2cEF4mqA8S8tPSvMNQFmoHm/cNoO4v76dZuK6TmgfUTrLMpW4iToRe1Eix/GaZa5AMc2qlnS7LirWzM+67QgNAOc1exPnVKHsf4LW2hr+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8nGYFo+suMVzUKDLSw7PBKQvNmg4Xi5j34+11ymwZg=;
 b=YlEBKQG5DUEU+b+L+tztWwP/1ZV6JaaxErm27KA7MCEIDa6cFmx/McFk7SEwppR0MCK0OJUkDO5Qawp52+fPKVHZLOCRjx3Fhks8I8sePZhvPjl/4byRocpk4UjAPAAcBTMWItgXhxp7KMlUJ0F/BIF2hHcINDhchyy29yA/5bw=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by IA3PR10MB8297.namprd10.prod.outlook.com (2603:10b6:208:575::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 19:20:59 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Mon, 13 Oct 2025
 19:20:59 +0000
Date: Mon, 13 Oct 2025 15:20:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] doc: Add rudimentary documentation for
 using [u]stack as a value
Message-ID: <aO1RGGzV0a/+NL4l@oracle.com>
References: <20251010033337.4397-1-eugene.loh@oracle.com>
 <aO1P2VL5uBj0rMCm@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO1P2VL5uBj0rMCm@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|IA3PR10MB8297:EE_
X-MS-Office365-Filtering-Correlation-Id: 343b1296-5728-4e0f-d19e-08de0a8da43e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JckaGG54/Tb5vxOOBVI3DY4swentQ/NwXW5p1QCUxp3ZxEkIZFOEwfe7xt9q?=
 =?us-ascii?Q?obpS2HXb/EEshW10KKnS5fwHjNfVcmt5OqJDwMT+ej3tiFwkxvc/tmznLLyR?=
 =?us-ascii?Q?0dmDlJXbHNMmDPz12m6fQsbx4XM4P+ihMmtyC2McD+vfbQYM1ERSnw+E+4nz?=
 =?us-ascii?Q?9+3jlouuE3GlmeIVkq13dgb6+f6SR409QyZT7+uH8gKsn1fHQjbqHs0V9fwA?=
 =?us-ascii?Q?8mq1b04gKveCpp3G9lU6Gg/cK21wkVshuh9a3HyzSMmyLzQurKVvxDHze0PM?=
 =?us-ascii?Q?PKAvg7FYOhI0HaXwAUKbUA06sQMl4MLgQLTPo6f0pN0MMRm6xMSGQvYY9ySl?=
 =?us-ascii?Q?XOsBKdmGR4XseNwvZqi7faie5khwI0cpRdaoxVsabOcdUJy+nuKdy9kj+KYp?=
 =?us-ascii?Q?HRTYB+UqpOQZq1M7c2IsueNyCDyVUikAEoeSLDtEM1IHkWykdZ6/V13zIG40?=
 =?us-ascii?Q?fNp9fMwx5FQlyiK0O5OLON2j9eibUlSjbHMXQRvMGrZXD2eusVHm7lALnkO5?=
 =?us-ascii?Q?XYfgSqfVOn2w5Xa4golaTHRDE7fL4RJflb3IDVgVAVdGOG+fEVwf7kipwEWX?=
 =?us-ascii?Q?Q4sDxUy3Zu8vX0/sRJxCSh/U1KtmcN8gEmMkn+C/yPerAN0524KnXyBTcD1M?=
 =?us-ascii?Q?LZ/7BsXMDSaQ33pTLWmt84jU6b91xfdTgNvSn3XJimYsB66eR+0v9jOPRAf+?=
 =?us-ascii?Q?cG6c/9t2MdJK9QigNjDiLHBO4PH+qN9WpkcVXoePaITc0otOy7afNsUOV7xC?=
 =?us-ascii?Q?uurH8EY7p1Qi53321evgajlM3qlKmZ7GTmkILzjnoFpKXuO3c54XO2NNOFiG?=
 =?us-ascii?Q?j2Gz/oGbP5slFQHj/XMXJohw4m/z3f2ttxBJlWT3GoZ6BODvHw6Ne1ExdE3A?=
 =?us-ascii?Q?vzORgP0ZSSQmcVNG4ON9ZhQgUDn9z6cxVqWZEtFTdmY5hrtlOPtIPNqAQlfc?=
 =?us-ascii?Q?9XMCDYFmC7U3ma+okMm5frUTeqK+JWpgO9f9ODh90d3fNugGev5/LGeTGS1W?=
 =?us-ascii?Q?puCHbvF6M8zBGADx/PastDi6uU7Nbt+TH/pwnXlbUHfeynt+ZAsYz/pucaaD?=
 =?us-ascii?Q?rW52dcdTPTamRwyHuSaqypxPp8sIfuPIQOrPe2zlNovFzBQftLrZ6Vn5DngO?=
 =?us-ascii?Q?3ZvwwchymmuRnTUI3hGJ/jJIQtfNbAA72VjQ3FH6+5px+R2dpsfvJZZ4uBRf?=
 =?us-ascii?Q?bbyx6s6mzh+gT304csfo38meNEdnnuayaQ0lbT+Ckc+C1mVqEDQf+Sg9fHom?=
 =?us-ascii?Q?qDf7x1pj67KZYym5qBtghRtR0xG8pMOli8r6+oSZ3gZn8Tm7AJG3dXo9GpA9?=
 =?us-ascii?Q?xMSTADh38lPFTtEjqBL6chJVGErZtaxzOqJ2pj1/oOb/pJXTGgYlUEkYHd1X?=
 =?us-ascii?Q?YwP697ESRuKLnZ3ZfT5nJmHbb5dLqjskQX4yuZCO4l7bi/y2iPiwpOZgWTMa?=
 =?us-ascii?Q?dQ3Jz6lk5DVh/6bsn8PSGcbn/VgNtyiERrKEENe8Hz8gzLZVeYrh7Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XbK3kbQcm4xcNPev1EskKhHNFsTSKZ6nMD8JhYkJJGmT/BXRzxzEruBoFhgG?=
 =?us-ascii?Q?qioEFZu6ZVeHgMLHbDAe4XF13F5IOd5YD4oFULxYQElAopqGijioMofa0JJK?=
 =?us-ascii?Q?rlRAR64VeJzNELdkQnbPeEDIV8AUxzODQlk6NbC1qQEGQE5U7ZLCHpgKSn7V?=
 =?us-ascii?Q?S8TYN9D3nYU0yrzKGuBIZ3e3QNernAhyA2gDhGWPVzrerjNPWOtT3DYxH1VA?=
 =?us-ascii?Q?g3QJXnGmQ090/nkKYekwdzRwfdy4usn7WaPz8KQM54EmwqOUVIEX8cOwjDS7?=
 =?us-ascii?Q?+BQwT18xb3Xy9KCTTWgBG1+CURsliYm/xNgwfRxTxEdW9CrnPNIxNVd37BVJ?=
 =?us-ascii?Q?Wf8N7/9Ykj+FG6twioCWBT+FioMXb6kfOFktwND5U229VCEJuQW1GhkzFKNM?=
 =?us-ascii?Q?gt2Tjh9/amlarmHdL/EQNy4/L/Bj1IMsrkV9MMeqVJnJ0WWTU+GL9jkxPp0y?=
 =?us-ascii?Q?cuNsHDy0pkWpS8uYHe3t+YmUfeG3NCQWKKv9C6Zlrb3vWwSG+qE7QsJJsYQN?=
 =?us-ascii?Q?ImosK8EB3yQTjDyJfH87Ztmi1bw6o1p/gee7PVBbQSAI+fLCSEFq6YKySGP/?=
 =?us-ascii?Q?TRrDDVi0KKqH7hWntdaQDyj9xivrBb2HNEU6+rZS1uOHT6iTzJ+3yCsHKMXy?=
 =?us-ascii?Q?trpw63VUYlXZqAnci7hUpsPTmZtaTSgNzF3N68wk0g4xGpTycaCT2ss9Y98T?=
 =?us-ascii?Q?RG5XeGRuSE70tITPVzHxg9e9yGxz0JIsbqoIGPpfVKRT4sTeDeOmLQK+8Umz?=
 =?us-ascii?Q?EHNeu/gFAiBxETI74p3p9JEHKPYwPjYbvCVIwkCtSIDsspp9JvNTGG2LNxbJ?=
 =?us-ascii?Q?bFEHE/zJKWdPz+L+CAnsoAWtzHX06RS3TSgxCAFG4Xzfkabfw8YspYVblNS/?=
 =?us-ascii?Q?26dOvrky5KsUrvlL1twKrPMSpn1w7TIIeRMI6SNHUDVewJeiTgKIv+9Dehzz?=
 =?us-ascii?Q?/LaausBS/ZKOyKKb2fLjkIY20CTovNcdETI+sDJcyHnHdXYSofo/mDq/VSu6?=
 =?us-ascii?Q?QBgc5ZAdtD1ojP7BpxNY1c9gBot9kVKiWY1jo8FHBVo3ZuhLLNrMiCrQoc14?=
 =?us-ascii?Q?FmjAxL+Q5Xi5JjlZOalDT3P9c2bR+9ott36+VIskddz6F+q01XDTn2FYF18n?=
 =?us-ascii?Q?aB59DPyUxIIHquDWOV9Kcy5/qODCeBqpEq9tuqms7Jwm9QDpJM2kQNHF78fH?=
 =?us-ascii?Q?n6uhrfavGLH0fTwQ0YvQjoUdzU/NA/u4tHwJI35Cg61UPDYCyeqY0iiILS/H?=
 =?us-ascii?Q?IW1uvO4YIWJ86T4rszqO6N5jcpSA8CSrFRlantHT+TbPm1mYYWfglpHUaYeZ?=
 =?us-ascii?Q?Bz30S6G+4aqwB4sDPoNW81h4LraUvRMpCiCQj+p2XdWv5M7isJduUnr/isNK?=
 =?us-ascii?Q?cO6hxcL1tiKzPxc1S68hQKLNoOcDsPKUyNpIIFC5Tmcak6VtNKtQsGKv/N73?=
 =?us-ascii?Q?kw7BEwyJDMbAfphnKMzoLykIxiOqsB3kNHWpQFeRnWJRIldmpi7bcKsNnDdD?=
 =?us-ascii?Q?8ZuxqYMXWkUHlOEpFVp2nvmmzNumPNtqUCYjKpK9kNDuy5VQ8euuKEV7Z8Fh?=
 =?us-ascii?Q?DA3/eZNyNXqxdvjTgmi/zNwMjZ3irrpvQUZHPOFkVoaCYJ8Wmz1yOOGZioGH?=
 =?us-ascii?Q?UQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V8M6xlsFLdiAlvoyIcdHX9u53jIix+puV6UF1op52fbCACQ8G45JM1HXeDPgfdGh7hfRvgRydOyHSvkGe+cYO/hRwAWpqq3XhfAN09Uz+4LaogU4oenrTzijkXvGG01iRbbWREmUn6fNLSp48L+Gc7B+/JSktzJnkmvHV0+lmQ3qH8NW+hEd0gpVA84qm10BcQ86y90poZB4qeeqJvEge8E32yWGNo6ffST+ukygXPq8AKHj3Vlct7c6GIpFUbjmVmlGhDSfkit0f81+gvSxzGsS+/a69ABC1q+GsaGt4sTHYtZc1tvL6LwyW1CuXx3UWkFrVkBDdIg5uwA9zAJlLVUyEzm444LH5moyAOzdzq+F87Iz/lIxC7AIIVqGxzm78uz6b3fyfYc21EjFy9d1o43P8wYJ8VGqE1+En8ddveicuwsXe6SInhuOuCcI5w/xupF0WxfLT1NvGfsmfMPRsJ7xgPIJNOhA6/mL/RPksbKGHO8F4pc0oOljNzQjfxVwKS/iL3W8218jpfGTIBFHYbxNPurGUycVwDEEIp8ivYK1gwD7Ssrj5rEcttgtgaqjFzSAMRXqrAcOJbjCjkAEx00b6gHefkeQXBKLs3vD5E0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 343b1296-5728-4e0f-d19e-08de0a8da43e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:20:59.6841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKAMYJvXHvB7qzLOBRk55i8ntbE+05HTNhlYgWF3amVlLVb0wYacW6xAFn713/GgUKifRFrAJgSawH0MVOnYXiO82gHSEpT0vPwPhDempVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8297
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510130086
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfX9R6UVm1Iag+l
 0MNwYgsvtf3/vUjwv6yS0gigP1wo5/ABhCu9rV/nP3Q7ZiLR32JqBUJiOmX4cTEiyyHgCJ1WAdz
 xyZmwijRJSfl8jA+cDHdM4FkAqzsfHlqRnwa3j2ftXhbbn6aoX7d19+EuahACH63wUKzMGYmT/n
 ikon9Phm45Wly7IFDGVETzj542P1+g+/Xvxli532gSEK6V2neBJ7me7HjY93LpZZoDEVP91Ojfi
 6htwA2668+9Cq2xyimKjebTUkkyjx3ka0ZzWtUGfQX/poqXU0Z/SYkaQ+ngQ+8DsaDDzkfy/WpW
 b1l7B62YD+6mqbig1lNBUzXmLXIlS4ShfXm9T5cd8MsO4HNI2AJOQ8hTOSKFs8F/e3f/yx/BS74
 asyir/LT18+qNoTPBnf9aLhTcGhpLA==
X-Proofpoint-GUID: GuJshmhfuiDjYnwcvBQp1txRiHc538PC
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68ed5120 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=aF8WPlFYFM0Cs2s_U4oA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: GuJshmhfuiDjYnwcvBQp1txRiHc538PC

On Mon, Oct 13, 2025 at 03:15:37PM -0400, Kris Van Hees via DTrace-devel wrote:
> On Thu, Oct 09, 2025 at 11:33:37PM -0400, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > While we are at it, break up some of the super long source lines for
> > future maintainability of these files.
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Woops, meant to give this R-b for another patch.  Ignore this one for now.
I did not review this patch (yet).

> > ---
> >  doc/userguide/reference/function_stack.md  | 21 ++++++++++++++---
> >  doc/userguide/reference/function_ustack.md | 27 +++++++++++++++++++---
> >  2 files changed, 42 insertions(+), 6 deletions(-)
> > 
> > diff --git a/doc/userguide/reference/function_stack.md b/doc/userguide/reference/function_stack.md
> > index a92c61a0f..d172dd017 100644
> > --- a/doc/userguide/reference/function_stack.md
> > +++ b/doc/userguide/reference/function_stack.md
> > @@ -2,17 +2,25 @@
> >  # stack
> >  
> >  Records a stack trace to the buffer.
> > +Alternatively, returns a `dt_stack_t` value that can be stored in a variable.
> >  
> >  ```
> > -stack stack([uint32_t *frames*])
> > +dt_stack_t stack([uint32_t *frames*])
> >  ```
> >  
> > -The `stack` function records a kernel stack trace to the directed buffer. The function includes an option to specify the number of frames deep to record from the kernel stack. If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option. The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
> > +The `stack` function records a kernel stack trace to the directed buffer.
> > +The function includes an option to specify the number of frames deep to record from the kernel stack.
> > +If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option.
> > +The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
> >  
> > -The `stack` function, having a non-`void` return value, can also be used as the key to an aggregation.
> > +The `stack` function can also be used as the key to an aggregation.
> > +
> > +Or, its value may be used as a value to a variable.
> >  
> >  ## How to use stack to obtain a kernel stack trace for a particular probe
> >  
> > +In this example, `stack()` is an action that prints the kernel stack.
> > +
> >  ```
> >  fbt::ksys_write:entry
> >  {
> > @@ -22,5 +30,12 @@ fbt::ksys_write:entry
> >  
> >  ```
> >  
> > +Alternatively, here `stack()` is used to assign to a variable and print later using `%k` conversion.
> > +
> > +```
> > +        v = stack(3);
> > +        printf("%k", v);
> > +```
> > +
> >  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> >  
> > diff --git a/doc/userguide/reference/function_ustack.md b/doc/userguide/reference/function_ustack.md
> > index be9436f82..01d282c7f 100644
> > --- a/doc/userguide/reference/function_ustack.md
> > +++ b/doc/userguide/reference/function_ustack.md
> > @@ -2,14 +2,29 @@
> >  # ustack
> >  
> >  Records a user stack trace to the directed buffer.
> > +Alternatively, returns a `dt_stack_t` value that can be stored in a variable.
> >  
> >  ```
> > -stack ustack([uint32_t *nframes*, uint32_t *strsize*])
> > +dt_stack_t ustack([uint32_t *nframes*, uint32_t *strsize*])
> >  ```
> >  
> > -The `ustack` function records a user stack trace to the directed buffer. The user stack is, at most, *nframes* in depth. If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option. While `ustack` can determine the address of the calling frames when the probe fires, the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility. If *strsize* is specified and is non zero, `ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel. Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace. If such frames can't be translated, the frames appear only as hexadecimal addresses.
> > +The `ustack` function records a user stack trace to the directed buffer.
> > +The user stack is, at most, *nframes* in depth.
> > +If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option.
> > +While `ustack` can determine the address of the calling frames when the probe fires,
> > +the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility.
> > +If *strsize* is specified and is non zero,
> > +`ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel.
> > +Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace.
> > +If such frames can't be translated, the frames appear only as hexadecimal addresses.
> >  
> > -The `ustack` symbol translation occurs after the stack data is recorded. Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible. If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> > +The `ustack` symbol translation occurs after the stack data is recorded.
> > +Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible.
> > +If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> > +
> > +The `ustack` function can also be used as the key to an aggregation.
> > +
> > +Or, its value may be used as a value to a variable.
> >  
> >  ## How to use ustack to trace a stack with no address-to-symbol translation
> >  
> > @@ -35,7 +50,13 @@ Mon 20 Feb 17:38:15 GMT 2023
> >                0x7f6d63fc2e65
> >  ```
> >  
> > +This example shows a D clause that stores the user stack to a global variable,
> > +then later print it with a `%k` conversion:
> >  
> > +```
> > +        v = ustack(3);
> > +        printf("%k", v);
> > +```
> >  
> >  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> >  
> > -- 
> > 2.47.3
> > 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
