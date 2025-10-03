Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2408E136658
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 00:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759449649; cv=fail; b=h2hC4DYDXNoswInAEjbIBqZ+tvwZ8CCCUs00EZrvVaPj7B0xE2LzA7kbhbtyQQY/7mLxWR6gdlRYLrKjPx9XSZ+pbrwzbpF7hT0Mz4wDw4T6CrtzRIKgFhfRmLipCjIb2U3F4BmRM71iFrCorAx18l2GESILckTBT6oOMHKEeLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759449649; c=relaxed/simple;
	bh=Ir+gztEED3FgSumP5GTtV6Ps1rLhmDaVMtF51wmHnWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ff2kzAeXKauxobABqeQyc91lQPfefqNWeQA8MHsMROQICqa5gQK6yh8E2CWrhT2MwBhQIROHLDnvofqr29O2rGAcNZqKFoZ5rHWMcdFYOQ5el08/4SfSLP7KC4BIAp7r0dLZyIoeFm6FZx6xL1LC20ev3uS6J8iNfbDjDxKeFMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cv1TM8A8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=B+mIegpE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cv1TM8A8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="B+mIegpE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1vhD025323
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 00:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=unQlx5qnNL5DH33U8O
	NMirvw1GLDn8sNFfssALiEYzQ=; b=cv1TM8A8QvLWnCJJvfwevJ95TDbR4Or+Yk
	ZGOJT/Z8iIGTE8l/BBWuDwSQTTazlHVgRmc0PMzGrGPw7xtv4Tcd/fnNHhSAD7rU
	CAsxAAbojxzJRh/+dTKnGBNzxeE3u0613wNnloypfnvKfYMp6wDFNZYHF+P6C8l6
	cSW9qyGa9ec7KKTkFXbIyh1gtpMmOyraOvz+YULMeNGKsP/dvxAAGx+cXIvurSC2
	Qqs9kaI/OG6uf4Cp7QnLVhO55gKFhshojm0WDCt6bx7nEyhtqwWnjkxiNjV6MQ/T
	XUJOZ7W+nKc8S82TAspTZgaa0uheOIUxFiwNRhGAyA2y/9WF/Yxw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmcq4b3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 00:00:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592NfLBu021528
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 00:00:46 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010015.outbound.protection.outlook.com [40.93.198.15])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw0yndgt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 00:00:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rq1Kj4uQfPCoq3txDLgHNNI7WXKacOrwxOOaeycuFRUHSHvC/w3w5tRGAtsZbVvGv077Y0VKnXKkvUFSXx295zQADHW80jLdS00W5btTqLs2JqXr62CRh40gcNDP+F9aR7IiVpJHuP4TPSyXCAqEsdg/NO91D961UYuymxJ0w7SVnUhmlZSHLU1MODE+lKGjvoq5BjXHd5Eajwj3ONuA7OQ8Lka9AGBldzwk+xtZFYxGzL54SgUvEocOQsO/raamaSmo+1rUxdF/XgLKn614Zlbk/NxclzK3r1yebVRnbIaJQ+J3L+9EznYlcoMRndsPuS0vN097VU9/Jak4Dr+kyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unQlx5qnNL5DH33U8ONMirvw1GLDn8sNFfssALiEYzQ=;
 b=t8xt0BfpLb/D8XfdMLlqG6rkbptCfayOSyCM1uocKOAZvyfabRveGLkoQlEeUmk3qPLTrWJ19kYmYZQ4b/A9NNNnxrSsCQcrtc6KzQra7FZB1Wg8M1JS2/T0Trtywj5+rgflB9dAJnAmfZe1eogxZNYeczwItdLEBV/hckHDtlao9zRjehD12OLM08BaK7s+Vw+GpumIGZbSEeujxFFXvFYv9kiwC0ZYaebN1KrWnEwjPLQ4MVWWeryGNgjRWGAzmQ/NB07pM1m7Xzbxib8Mr0pUZ+Kl+JV36EPO3n/0m3i9Wy4wOKKPQq8DXFcmOjuwSsUdaUZK3xZ8YISoUTdHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unQlx5qnNL5DH33U8ONMirvw1GLDn8sNFfssALiEYzQ=;
 b=B+mIegpEu1JgHdQVLcVrakZhVFVbs8ZIwxBW8EX20FLF7YwI1AVfh64y5Ist5CP83c2vb3Z396HKyQG92ottjPOuHSksdTXDXM8wdsLMplR//1jMgXoYtnVB1ViVJrOGCdgq+KHlHMaQDdGYAe4IdED2wBIbz7s3GmiQh/oXWNw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY8PR10MB6754.namprd10.prod.outlook.com (2603:10b6:930:95::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 00:00:41 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 00:00:41 +0000
Date: Thu, 2 Oct 2025 20:00:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/4] lexer: the things inside an enum {
 ... } declaration are identifiers
Message-ID: <aN8SJuq1TLvCVs/k@oracle.com>
References: <20250918180338.197827-1-nick.alcock@oracle.com>
 <20250918180338.197827-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918180338.197827-2-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY8PR10MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec6f3f6-5cda-4476-7ea6-08de020fe479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DOEEhZje0dxfS79TrVPqm4zcgmg1mobGxu9NazIZy1nb4JYjShxIW49jVMcg?=
 =?us-ascii?Q?HAYgSEZiRkc4bbcHnjOvN1Qzc4ug7q9BTSbtmjRzNmXPBCy2y8OK8VIzJxtg?=
 =?us-ascii?Q?FaNHpF81UQAghSBHSGni922aRZgttzkdIwFdI2y7M0tLNzQ5BI4bW+/aKK/D?=
 =?us-ascii?Q?VCnXp7aa8SSXYEKtTDRWU8FBMbXrm4i2rCZId6g6fbydecJRrWLTTPjCbrwq?=
 =?us-ascii?Q?j6BT7vrqxEzJwoll2xcyUEbqqtvxb3ek/EQ+Fz1znuwxTUE5JGkgwjh/lyMj?=
 =?us-ascii?Q?DMZofoMGaCPe8n/cSL6EPYQWxaZj5LzWAfLaFSTZgjQ/m1hqYXDwBT3S8DI3?=
 =?us-ascii?Q?hqDCPWC8LnOXn7/iJU0Y/c3BRprA8kBAEPlWCGqkOY17Rdutwxe69q6eZ8MF?=
 =?us-ascii?Q?V0ueZLSuBOlkhrndqeN25zR8foq161abBUHD4Iv/vt8iBiv6eKCTrg2oHKiG?=
 =?us-ascii?Q?3h0X0z/EfCt2npaQrza/5k1sOa8GNg4qEAR/PKoJ3Ocxzk7fJVRJFYNuHwU5?=
 =?us-ascii?Q?8JBBcuZczjZljlSb3kPWRw9yTEUkcYxDqqeTR4J3B4v5aBl6Rt+W9IQEi3KG?=
 =?us-ascii?Q?nRnskMVdtxXdgls6JOgrGgdPuId6Wp9jfVxHq5RWVN3ybo2Ks5lKSheUQL8c?=
 =?us-ascii?Q?VQ62Xzndz4gx2s8pt4djxYsFPuaPqetey2c0IO5Eil5r9ndjwDH03FsfyaWN?=
 =?us-ascii?Q?bFrl2ZXh4zOZXAsOLV7qVjaRpv5u/PoM+HI6qMR8sWXj7d1gDJ+Xa94mlW/K?=
 =?us-ascii?Q?fhEgE0Cv4V+mkuKk8BNDv2BAU8Ie22VgwefrbJvjBHSgjSWuQWRH4UGpA3fu?=
 =?us-ascii?Q?uIWoNUBwwlSFsG4mp4NhbBWuUNEeqY+03lh94xelrQC6k+Jfm4THPIXhhNII?=
 =?us-ascii?Q?MzO44C10EI7oXuijYJKARgkgGSOYrNYorriY4YoUio3HKxuqOHLLT2P9sX5f?=
 =?us-ascii?Q?lSaGE696wPUywXFspuagjU0pOtSMSHiXlq0lMW6itg4GiVY8F7oQIhl098Fs?=
 =?us-ascii?Q?czDYidbB9Y4RmP1zcTbz4UVIYsOwdNr3LwrkCsRwOXDEGejZaFKIV9ZxfTRN?=
 =?us-ascii?Q?ICZLuD1XeMqvfjWX3rX1unVG9lneg8IP8uca4IqbHKCzlZlF7wA1z8MJz4du?=
 =?us-ascii?Q?sE02OYENRKfK8CeB4KLqJKfaw8v3T/EyZH0k1ICRqAs7EqIXmx6vuN7vHWF+?=
 =?us-ascii?Q?fBxEs7S7AC8sKzmE++uDZ0KiBwLiooEEXzyzlQ2a54K521vokvU+AvOVOMCB?=
 =?us-ascii?Q?fcH9XCBzfpClRiwQxD9SpPhEzRe8FLJU2IuemY9A+j8WdQyg/cHyoWfyhAAf?=
 =?us-ascii?Q?JQ0pMi5nfbGihm75NaoShyTIs2O35wrPYWczOpmcBYcZ8UEqoDaVTMcIGQUN?=
 =?us-ascii?Q?y2zQ/z343uBuocBr4ZkpW+3Ajrs8nSWZUFsB2+GQIOkwotWiZ9EapU111PYI?=
 =?us-ascii?Q?4stbAn/Umb3Hs9JNnpo3z5ZtXjNXRcqDU8tpuIRYgkzFPp/35zS8KQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ctLx1QiyNlROqmo4cGFm8+hgQ28vbq28MXG6nAlGz41TNqVCWJX/JUJcSZJt?=
 =?us-ascii?Q?YQ0tHSSW24o84TXSEcrsOyAsnb4pbd1dYMPvK4QwjxEOqpfRuU7Ht9FGFJ+c?=
 =?us-ascii?Q?7xCLNH4Mqr+ZdxVJPVRZ0em2kpy+Z+JV49pPVxjqm+cmhow26sR7KjCfMckB?=
 =?us-ascii?Q?23R6OUSHiR9GIRG8iqdEcKWmpqb7g7OyxZRZk0srPL35gmhjlB+kOvCdVm7q?=
 =?us-ascii?Q?yMzHfGuk2LqqgNIdHKyfSp0jGb4LQfT80ZsQMPCGNEaxWYgCnX7aCIy6lI4X?=
 =?us-ascii?Q?VvHRmJ+xEzQgsCEqRhaNVr3Qpglrot/jJg/GyhqX7uNpqpOXJU3ad2+KTdYK?=
 =?us-ascii?Q?fidsdC4RMouYtXTmBVuaZsSFBMI7AOYixTL244xISY8YliWzTVZjUC+hoQPG?=
 =?us-ascii?Q?Muk6svQqIvcVwKuwPpWxfuONOtQJAbfJ9qCE/R1XSoMIiXKhnV7R07AuY7v1?=
 =?us-ascii?Q?jnLJ7sgKda6H7DsVsuv3g8cayFcdJGjVscAwO3elt2gm+r8DFf+mvPOtZlEE?=
 =?us-ascii?Q?CGLmzdNr47JRpNfl1p3TYTx7Y1j5R0Z0oi9tIdjwWKUe1S6vLuImEdRM11oO?=
 =?us-ascii?Q?xNcQkvxCyQYRRQ77BHY71tU/4y0LyVkaovTyAzqRJdbc6lMbuCtNxo1jIG8k?=
 =?us-ascii?Q?vv3kactwHKyUiAdkWd2sJjzhj1k3rcl1CmsUa97w/8OB3HfvRuazBo2URns9?=
 =?us-ascii?Q?49rfAchq6mrA6KEs89en2krPmkvkmquduY8kDI/4OIBbYOh03/L2KWT2y7BR?=
 =?us-ascii?Q?qbLgBOEcixaTfKDj+W+L6IWnk7yylDyeLfTpZxvVshz2XizEraXG6BV4tNT+?=
 =?us-ascii?Q?60ObklL412XPBHaVSB6NFqMCkOu0zWneWGc9yXc3XqxumYbayqzm3PJXfbLp?=
 =?us-ascii?Q?Tjw0VuHB4YQS3CEflF2Lv1TnSgpuHHXyVtsFWLNrIJnFBKYxjdmdIxDxBPcV?=
 =?us-ascii?Q?vjCefLzhRiA4B7jjNuzVYPpX1u6vIPmXSAdoxdBLLJPyJ2C12eTKA7Ny22xV?=
 =?us-ascii?Q?LASuFjsvlPLPYdZ4jcAqwyNlvz5hhyj7nuhSHNQqn+nwT/BncsHBRFuq/ck9?=
 =?us-ascii?Q?yyk7ICTMZLucISNK/fzOnGiN0sat5U2PxyzVZkdo2c9nEmcN+Sv9nAESP9br?=
 =?us-ascii?Q?EkKpF5eknU0NvURtsO/vpOwugN8Sz3Wuyl5CC2yGK+d1rrUvb/waiFHxg1A/?=
 =?us-ascii?Q?U9YZztDgO1bcQfWHLuoZquZp03xAspA4US4Jcc7kPkkeGGRwM1ncUx8/8hDs?=
 =?us-ascii?Q?h+52DBiD63d3oTElxkxr723KYBEpdXEvm/YvtmCW8agia51QLq1pFYV416TD?=
 =?us-ascii?Q?CH+lxHu/8sGl2YFv4xaqEAgnnGwjf/MM3/JmhcTQDNr76ZwURXCLKV9AcXCM?=
 =?us-ascii?Q?dD1wdnhEQNXIbL6/XtcupJVrmnKVJAjecXTN6rA+hojQAkcgRRix2MXhZSUY?=
 =?us-ascii?Q?g50ZQSL0g8C4b7PbQw2Xmh1OTxtIYG7GVjR81v+cSLNtHPudDr+BvhYUQFh3?=
 =?us-ascii?Q?GajK4lXxTPGA8HzeOb/+JX+CMll0SyU86xm/fdP3Kv+lTp/7eqaRcxjZhRJu?=
 =?us-ascii?Q?LOAe7h0Q7YWMzR0uWF3YGVghSeq1u+8ZEACA4BIxp0Iqv8a/ejogiyiH7f2T?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p77fMAb9vI0EKKfCPHyQVOlp71Fbtd2HYFSazLvlQkYhFO3yebEugrZ0PBeVUau673OyEM0DkguB/0KIHoU4PC/zQ0BFTYiTA0kbLj/1AFSQtnZuQyemWrYVAq+CuGVoxPVlx9f5eNifM2Vs1GbRKbqviC7GhVQzaIrbI/8T0UrtDSXhdx2kjBaqB+3uexG53//tZUJEWivGjfVZw8pqdtz9sVvdrKb0o5zJxP9BuPfs/NZeAZaA0rSb2turIUTzaZd5QjxpR/x+ja8QotziMxw3DYaonYE4H+f94Vs96m6k0Zx5gYVq7H07JuIPIZv9ReMw75rgZEk6gGn8vXehNmeIN4UveojqR5jMZCiiYk9TS5SJrxlRz+N6VK5/fGZPk/OWrtEq07Of+xKEx8+BWS3tCKhbv9SLGXe8k/lMuOGKUREsuobycTO0IImOy9d4k/bKh38+Y0mwm9pCjjnql/VCE2nJGmsQWGOBUIpR2IhCpXdP31MNAWbMoEfm91etkQ8vVYtP7CEn1DTIxPslkaevtfjurorRTarRqRz3Dx017yb1l0g85S7VUs3/Y3O2CpwLEW4zWyGjjeTBUc6WXFwJtHl8wSE3iPJMCRw+L3U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec6f3f6-5cda-4476-7ea6-08de020fe479
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 00:00:41.5307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dy4pZhy5e0lqgVc2hLXEtyryPEcON8DitIFua8CyRl3NnsJcetA4bVSUtYKpcu4kfHEsYkyU9y6e/WRNNI4511Qa79zufQX81HvrRf5rUo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6754
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510020210
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NiBTYWx0ZWRfX4WFNhU52YwQt
 SRFoiJg2Enuf++AQAhg3VMNKeQUxG6jL1lDHXlUmAi9BpiR/v6+ILM0Hsi4P/0oP4OkOSKJAf/W
 fwqjerVjk0tF88xpyJpeDONmoS2n4QryyXbvBgztLvu+VLfeZuqk0q6U+8iNStXT4MOkr9wsf1N
 CuLRDqC0YZJiX1zuHR9qu4+lAuzmolmc1i5DKZ0UGbmnHSTXGo+TcrLdHBvmsQqBcZImVcT+ftq
 f0dMJe7S5Z5utWFJgTY/fYPDSHlHyDqMgxxJFy8Q81rHVmPPKqKFo1DqXf/xNdTK7n69DPAyv5f
 1dw+ywwyMpETqTamaByicUcmI8Y0dq4OFes6FssrmbkDB99Yumjp/Y7DJU3YwaV3OIpRhUl4re/
 XN4bgVAUvZmINhaceBO5Ao91SU1TRg==
X-Proofpoint-ORIG-GUID: YG7ESvmOVMh-6Qs2Qsbbje1dcwfC5FJP
X-Authority-Analysis: v=2.4 cv=c7amgB9l c=1 sm=1 tr=0 ts=68df122e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=fsob1U79ruvYgeJdBCkA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: YG7ESvmOVMh-6Qs2Qsbbje1dcwfC5FJP

On Thu, Sep 18, 2025 at 07:03:36PM +0100, Nick Alcock via DTrace-devel wrote:
> The code in dt_lex.c:id_or_type() tries to figure out if something is an
> identifier or not: if it cannot prove it is an identifier, it concludes
> it must be a type name, which later triggers a search for said type (or
> identifier) which eventually reaches (expensively) across the entire
> kernel CTF.  Usually this is what we want, since we use type names that
> actually reside in the kernel extensively and do not expect to have to
> decorate all of them with `. But if this misfires bad things can happen.
> 
> In the case of enums, existing code in dt_decl.c checks for duplicate
> identifiers, and carefully avoids considering code outside the C and D
> dicts to be duplicates: but if id_or_type() concludes this enumerator is
> probably a type name, we'll import the thing we find even if it's an
> identifier, and then conflict. Enumerators cannot be type names, so this
> must always be wrong (if we actually do put a type name in there,
> dt_parser.c will correctly reject it no matter what the lexer says).
> 
> So add yet another piece of parser context identifying when we are
> inside the { } in an enum (we set it to 1 when the enum is seen, then
> bump it when the braces are seen, so if it's 2 we are in the relevant
> context; it is reset to 0 on every ;), then use that to forcibly declare
> everything seen inside enums an identifier without trying to chase it
> down
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_lex.l | 17 +++++++++++++++--
>  libdtrace/dt_pcb.h |  1 +
>  2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> index 9f12f5c7ca289..fd70aa0aa5803 100644
> --- a/libdtrace/dt_lex.l
> +++ b/libdtrace/dt_lex.l
> @@ -88,7 +88,7 @@ if (yypcb->pcb_token != 0) {
>  <S0>do		return DT_KEY_DO;
>  <S0>double	return DT_KEY_DOUBLE;
>  <S0>else	return DT_KEY_ELSE;
> -<S0>enum	{ yypcb->pcb_sou_type = 1; return DT_KEY_ENUM; }
> +<S0>enum	{ yypcb->pcb_sou_type = 1; yypcb->pcb_enum_decl = 1; return DT_KEY_ENUM; }
>  <S0>extern	return DT_KEY_EXTERN;
>  <S0>float	return DT_KEY_FLOAT;
>  <S0>for		return DT_KEY_FOR;
> @@ -128,6 +128,7 @@ if (yypcb->pcb_token != 0) {
>  <S2>counter	{ yybegin(YYS_DEFINE);	return DT_KEY_COUNTER; }
>  <S2>double	{ yybegin(YYS_EXPR);	return DT_KEY_DOUBLE; }
>  <S2>enum	{ yybegin(YYS_EXPR);	yypcb->pcb_sou_type = 1;
> +					yypcb->pcb_enum_decl = 1;
>  					return DT_KEY_ENUM; }
>  <S2>extern	{ yybegin(YYS_EXPR);	return DT_KEY_EXTERN; }
>  <S2>float	{ yybegin(YYS_EXPR);	return DT_KEY_FLOAT; }
> @@ -463,6 +464,7 @@ if (yypcb->pcb_token != 0) {
>  <S0>"("		{
>  			yypcb->pcb_parens++;
>  			yypcb->pcb_sou_type = 0;
> +			yypcb->pcb_enum_decl = 0;
>  			return DT_TOK_LPAR;
>  		}
>  
> @@ -488,10 +490,13 @@ if (yypcb->pcb_token != 0) {
>  <S2>"{"		{
>  			yypcb->pcb_braces++;
>  			yypcb->pcb_sou_type = 0;
> +			if (yypcb->pcb_enum_decl)
> +				yypcb->pcb_enum_decl++;
>  			return '{';
>  		}
>  
>  <S0>"}"		{
> +			yypcb->pcb_enum_decl = 0;
>  			if (--yypcb->pcb_braces < 0)
>  				yyerror("extra } in input stream\n");
>  			return '}';
> @@ -536,7 +541,7 @@ if (yypcb->pcb_token != 0) {
>  <S0>"--"	return DT_TOK_SUBSUB;
>  <S0>"..."	return DT_TOK_ELLIPSIS;
>  <S0>","		return DT_TOK_COMMA;
> -<S0>";"		return ';';
> +<S0>";"		yypcb->pcb_enum_decl = 0; return ';';
>  <S0>{RGX_WS}	; /* discard */
>  <S0>"\\"\n	; /* discard */
>  <S0>.		{
> @@ -769,6 +774,14 @@ id_or_type(const char *s)
>  		return DT_TOK_IDENT;
>  	}
>  
> +	/*
> +	 * Inside an enumeration declaration's { }'s region: must be an ident.
> +	 * Checking for conflicts is handled by dt_decl_enumerator().  No
> +	 * need to look anything up here.
> +	 */
> +	if (yypcb->pcb_enum_decl == 2)
> +	    return DT_TOK_IDENT;
> +
>  	/*
>  	 * If the lexeme is a global variable or likely identifier, then it is
>  	 * an identifier token.
> diff --git a/libdtrace/dt_pcb.h b/libdtrace/dt_pcb.h
> index 7c57f83220b28..b6a7620f4920c 100644
> --- a/libdtrace/dt_pcb.h
> +++ b/libdtrace/dt_pcb.h
> @@ -71,6 +71,7 @@ typedef struct dt_pcb {
>  	int pcb_parens;		/* number of open parentheses in lexer */
>  	int pcb_sou_type;	/* lexer in struct/union type name */
>  	int pcb_sou_deref;	/* lexer in struct/union dereference */
> +	int pcb_enum_decl;	/* lexer in enum declaration: 2 for inside { }. */
>  	int pcb_xlator_input;	/* in translator input type */
>  	int pcb_array_dimens;	/* in array dimensions */
>  	int pcb_alloca_taints;	/* number of alloca taint changes */
> -- 
> 2.48.1.283.g18c60a128c
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
