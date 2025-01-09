Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0F1ACEDF
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736449933; cv=fail; b=oAxqmgOvufKraJLel7vmdBxw4CPrBkv0ooDv2kLkMpPKr0dP5rqdUG0hQJroLWJfTIlASzJBcWyt85tZaAmlmpyFPy/V+vEp5cKRIenGeCO+iu+nfL/jLVrOmJoT88sU8wbrEhk4a5znjbYa0GQQnsIi/5PZ/VfZHwD9cmjKnF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736449933; c=relaxed/simple;
	bh=4T5XmS0BGnE/QhC9xrSNugHqlN19cXz2LyuxVxANev8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hdz7OHfUZQFfGHyvRFDx6LSig8nTGpwbqwj7PdSU8eF7UWJBr3XN98WGO0EvLqk7HX5ucF2ddBZQtxhOX14WsX424Bj02qTOxR6odp/ytcKjQ48nSGwnB1l0lv639tt/LdruoFFY3aJ5KJO+oMzyfuagdlF8Wqm/Y20gz06lBQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Cmbkayq9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yuabAE+b; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Cmbkayq9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yuabAE+b"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GXnt3005290
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 19:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=16myFEWw1LrTiaiMiA
	kzgBaAjLr3fLNp+8d8by6frIg=; b=Cmbkayq9m8UQibdQ5tDjKu4H9m57uDw1qx
	Ev7W0LjHFgIkyz8FfW/jJgOYSdRhsDZPyQIlq76VP15Kl98VrHDJbssKf7j7i53j
	4/adFUDUBL8LEIzqtpgVEQbWa0jl9TCxziCvUUE4jd0Ulzh0mTSo/ybwOVmweGiE
	QHOxy9F9+vcMZDgTUlnkCFSqhfA8qAtf4PKU0Ro1BZI829iL/2q+22fH3tkVDIj6
	gO+mwOP+tfIqnT6CeZzuqXRFDznY0Z1UCYYM0ANxcrcHIe5t/tgPlYNjSxdDxlBE
	jaZe8wyNaKoRrBOPSUrfNPfSXjHEsJiKKnbs6KfJdZGFGT47991w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xudc9tfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 19:12:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509I56Fa004824
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 19:12:08 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xuebge6g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 19:12:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIUQg8NBuh13OjxQ71NVlB0DpC4TFvcC8rRqUPhWrnq8gDS/CfXFgfAa4+FL3BJqYTDYAl5rmTQNP1jYRVV559hEFG88AGEEfxbyWG0Y43OEOIml6gqe759I/B6QrbwFRRQBCZ6gg7VI/c1f14zR3GsXcrc+5TvD7BC5m3bPRuSoAsYzCxfCmTcEiVTJmWR7qqmFquJvjoLhuOmx2fU0a0GRXYwlxp3AhvIfa79sHT3yViMGEkXG6n2jC17YHnsfxOOdQhBCxn4+BvN2oSnVbgF6NaO/203x175W3GoNEwFqDw5UG08J71kBGHNqxHBIzHDh5uKCgNKLJSn+Y55rJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16myFEWw1LrTiaiMiAkzgBaAjLr3fLNp+8d8by6frIg=;
 b=w77liUGmYzMPmNwCh65NFAUXPsQeSOB17bG+JLytNhpVAcBud6XxEbxzWC8jU0zfGJ0UrgAZOZ8TylHRy7/StGay5ArL/AA1XH+1lSPbbWLIofO7exO+PYPlzxe0ZvM+5r4z7TfVTLYX/9KsbCvOUCMYiwVlmZwylC945FewL5HxxfvqVyI8GB2fFCtiY0pNFg89dYnILF2pRinSjkxgeKm1v94C7iFytG703uwE/gGtmA12bYXmyC1yCz3F0QYLoJ70fkXjUOXqweLO526Hx6RFgj3PBRUPvBPqJLSu3Gt1VM4QL+KxneJ81HsEejcabwZEWxvFwCt6ZwVnwtFYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16myFEWw1LrTiaiMiAkzgBaAjLr3fLNp+8d8by6frIg=;
 b=yuabAE+bQrgZ/d8zWTLKL7fqjBHhTrx0gguJzU+44vCFGCQTucg0SAxO433nMEb/AiNAR551a31Q+i2dEzM3fCadh6OhTomATrKrDzGRf3U94JpHEtHDNWMMIUY4DfTI/gOlAAxxybMs7s/KQ5EXi2fAyB7jDIyXfBJYAabFQmM=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DM4PR10MB7528.namprd10.prod.outlook.com (2603:10b6:8:184::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 19:12:05 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 19:12:05 +0000
Date: Thu, 9 Jan 2025 14:12:02 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 6/6] Add support for pid function "-" with
 absolute offset
Message-ID: <Z4Afgp96zlq1g5Jf@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
 <20241220222716.18511-6-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220222716.18511-6-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DM4PR10MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f491ead-9ef9-4c7f-7e0b-08dd30e18126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wOfdyM5eYHNfh/30KAOnbwePd6dVmFD2trgVX9S/R3/nrNfURFOJRciomEDj?=
 =?us-ascii?Q?09X2E3PBs9tC6OqMgGBSuKJeApIBPxeP5mwdnB7d6NKss5a8ySR9NqdQFDcs?=
 =?us-ascii?Q?DYPwTaNmeoKnXij8AdOzKhPcZ/1ATTW4pDmqtmRUN82/JNWwn3xDES9pA+tF?=
 =?us-ascii?Q?43eEfwmiEsJYnS7OfErfbcBc97ODoKtfZKQl+aBKQvcWDVPLub3gL8uhyASo?=
 =?us-ascii?Q?TGpXL7tzd2mJiLqEf1wI3rqC9NbMdW/DqUcXkDmm9CaUoH6b9Wl5+mOnlHTY?=
 =?us-ascii?Q?uAbhhpNfOFtl2bs3CHtB6rsb3NiPv8n7q7OWREHUd/ejMKrSC9wG53t3ND8b?=
 =?us-ascii?Q?FQzis0WswFQ5fcqFTsO2RZLGWmbNccYjStgnrWYlBFlCCgt1L8xlpYE8FZ1O?=
 =?us-ascii?Q?fEiAThoDzNExoJDyIMIqKlhgp4U7jgGheFVHB+1wtrZ7OcFtNkRyzxBadzyU?=
 =?us-ascii?Q?wU4hEBrfNKz2n7mp3USmPtJrOy9aa7Xd0mwHyH8f/73sb6LLQilLAYcqnx9q?=
 =?us-ascii?Q?p4bEgKjLUdEZkTniNnRTLmLRBE+/O7ew6Vk4jtRv9scU/NShYPQgAh0jkERh?=
 =?us-ascii?Q?DURyiOb7CDBA9jw3HQ25kC3/SGX9AnjjMGO0eFMszhU73KlePBTKjuyzwtTc?=
 =?us-ascii?Q?335TG5lparobcO5XJMChQKON5TWsgcSsOz86QLmB2Ii9psVRSouDLMJkxtqj?=
 =?us-ascii?Q?YPbbnGf07U7otnn2BfgleM2hYxjCKsSRTN3kl5SrRRq2sEaiRJVgP0A1t7vD?=
 =?us-ascii?Q?IB8Zajr2Stc+1wZiAXh6ACbM6WzfMj1Y9ZdQzuPsuQM812t2NfdIVrEmacp4?=
 =?us-ascii?Q?JoAwYmocTObx7CkjWrVUjUg6dhdyu0sBgqtfpfvPpjl/dxjwys/VJSvoA8OO?=
 =?us-ascii?Q?K+q1HVHzXYqa28Kfvtj/ORkIlOHt2nFuDqLO+pH5Jgxj+LqtfAC8ViaNnNlB?=
 =?us-ascii?Q?CTvxY39qrSGahlvaD7hGEqYYBEUzXme3N4VlGg7rqSRSzgkKY1nLwum2sYIk?=
 =?us-ascii?Q?P+lYkuYp2Q10ccjjzRsPrb9TJUfGyzafSC8UAX7UkLdPjLqLGojh30eYXnKl?=
 =?us-ascii?Q?RrFOJlJxWrBbIhzqOW/L6UAmr8agWpKT1DJDsvUcPtXoztau21OlJsXLS56Q?=
 =?us-ascii?Q?k/hzBD7f5ExZ5nTyuAa0dtz4ondddSF8XSWaKWm283WQ1RPJ+iYS29sdfaJI?=
 =?us-ascii?Q?5t/ZM9BfOAweV1joZ9e+++JhkpAQZjTlGIZ6HGg3z9KAaK8NKguR6jFbEH8t?=
 =?us-ascii?Q?G42hAT1l6XYAthS/QmbqEcuK1/1sGPJBiK+s+lkDkxvxtFTmtebuq6tHu0S0?=
 =?us-ascii?Q?DjM2vNizHXmjqp8sYxcQSFDO9Refvubv4BnTHhyBML+4ww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I7Xbkb8JSxgsoC3E/u+/iz8kYf6yNKSAWr52G1hLyPJSTNVXz/JOhgRB+9ro?=
 =?us-ascii?Q?po1q7WHsWsaJIQ+/yKbj6MvRoJZCFd5y6SDqxDThgGjZDqT1X2Lj8FLFx9o2?=
 =?us-ascii?Q?o4TCACzMQtQIgprosyLSP05YBvoj0K1oaZKIF9LMbWyq9qMnjaP3xPmWGr1o?=
 =?us-ascii?Q?FAwl3ANt4kk9JcjA5j0exKXx5X3qcyrchpzJpTBkWHGub4LMJx6ZKkpF2BPG?=
 =?us-ascii?Q?bk3hw4H3lKmkCool+S37/IUIORuCWMNep18A728Yu1kRaUcgJ1CGirBzjryi?=
 =?us-ascii?Q?9NPuJtpocWyiqEVEP/iB1XlC0qBjG+EYZ3aD+bmcdiCCawGyTaHwesHdyw99?=
 =?us-ascii?Q?5Dm4Qo/xhVmBK5apniDLkpiCcBSGS7cPJSTHGk3S0TfPk3ecMuTlNJL7Vz0t?=
 =?us-ascii?Q?HpE5ivlPaSiQeP2Qgtt8OnN3U6LUCrpNMsPdOXJHJRwwi2CCNmd1NdhvduPk?=
 =?us-ascii?Q?n/KUDNcdu/5KnbXfDXYpHS4hL0EyZ8VucNAx6jXOJ0un3VrBvwpIQ5lZa8eo?=
 =?us-ascii?Q?wlcN7q97KRXcRdpogFOqJTXvhiGQ8JTqFG8bZZ/W/C+06cOybttZw6sZn7PJ?=
 =?us-ascii?Q?py29TVuc7Hw/soNiaR7uuqhs/s5P7lX/2KNTq+rcdHsNC5n/KfJp4XFeb2cU?=
 =?us-ascii?Q?wZ/mPOUiuxp4VLDsiHjJ2HmIj8bUXqIsNi038Zgi61XRtlYZZogRljMuJ4TZ?=
 =?us-ascii?Q?QcJJ3bjXWlVPOVq1obXY0wEOHWl9snLp73qF1DbkjYaeT6mbYOPcTCus2OzH?=
 =?us-ascii?Q?lGbGXQlLoiTPYpDSOSrmpIyTAgaoLKb54oiwH8nb9XUsu1y8txGLI4RPvfKH?=
 =?us-ascii?Q?6wSEDYROVT8l4dIiHop+rPGJkVPxW4S+Q71pwAxdfNLVY0rYW7N2uHwRvg5f?=
 =?us-ascii?Q?zgkgWnFyuP/mQ3ISDXJEtVkdbbxaZDJmfdhE8XGYvraafYS6iFAYRmsSc7HX?=
 =?us-ascii?Q?95RStWN92W8rgcfgAtS3rYmr2bKBuIDNmJNNKVm9BZIBmbMQPhqX+GZBIDW4?=
 =?us-ascii?Q?sfZVmk1gOuARa9lua8lPcJs+LApijSKSSzLOLKs07UKu+AaOaH+mdGVw5zhh?=
 =?us-ascii?Q?jzc2OBlLhSsc6O22eN5uVzSGLchmLtaIQarIgk2DMvaM1QVpDbD0Evzbsw99?=
 =?us-ascii?Q?6mZg9pWDQP1t6cglwDVfgphFnDJq9LD+oErgiqNoMcSn7BDytWiR0p1Oi5sR?=
 =?us-ascii?Q?OZW4EMawcLgjThQu8oNmUOv5emi89tBXYec1gJYn7DFW71z8cvIyp0tlzF/9?=
 =?us-ascii?Q?8tpF6XNQVEEyprTLTp1RSSUAnUB7bAPVmyExI8tairlyR1ZkiNgiTOqpPCSW?=
 =?us-ascii?Q?tP0P2pUQ4qwurNO1lKNcX/eGAxycvl0B8ns76kyQFXh6ZCRysDpaPLcin7iC?=
 =?us-ascii?Q?Gdmin8OdlpfPDzPfKkx5JXQf/sQ7OdT0C/ihEHh0Ban4Lz05oAo/4UPSsuKa?=
 =?us-ascii?Q?Dkl2P0iu4Eqt8+zk+uMaCrpk1gCgA4qFEV7k8YtyUTh758rt0BPi4wZy2prx?=
 =?us-ascii?Q?MsfAFBIEr96esS9Erj+wgGqPg0UZet9KMFyuazqGGLu7vmm/YUdCl3PtvVbg?=
 =?us-ascii?Q?Qi3O2qxwlpAjF8ZKBW5QNXJOBN/gpDxlGkaDV4MGRfVGX49hPn7xnsoQm918?=
 =?us-ascii?Q?vA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a93vgbP97eIV8d63vomOtk5PSiWmLz7x/mvZU//bDLyYDwhEqWTzlidlkXDJ2zLZsUgCdMYKJdf5d8EZTxHzWPm+yXVKP3En2XgCgDgFayYZMCKXDgBm8FWA64hoMC24r+OR29A5CXAFIkSIRZLchZ/2NChfuGyKivNRedr6jn0XrRNPJwe9sfRZTPjx4D67eWDRLsfdDrlsvFEvfb/sRwe0rKoBf8XRGU4S6Y2I9oLO/Tg+LUOV6R9uM9LTZgzEBBRaaa7/L/VRPzK0ccqc8+QxSh9NlkyjTucyaNtycKVb7BquFLJLKGw32swXaQnI/d6GOb2xO3nhIbasJUfKx8gkjVL5+jpoUHwiJaTCQo3gbs61lWNuuIMKvrEvWNxb0Hy4eqDU6qhU8RB745hWDumwkTOyxijk8ymJ/mvz9awEzqZOz4lLcH7EPONQre/C0YOWLcdh8wL9ju94AHWmCZyxNMgccfddbYjlm5ROdCVYC2oQ/I1rve0t5TDFNTO0+h/iSNxVRDKU9Xc+5gOweuFjxsaaOkfz0IjmVguUn1RDeQ3mXH+thNZfO66moLow3oqvxiaKcXzOzTIQ0jeqcEmBE5bCpLB+VVLqMMZpyaQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f491ead-9ef9-4c7f-7e0b-08dd30e18126
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:12:05.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a854SVVFOgUSONWz52ICMnC4I/sPWjdjkBnwVdbaey9Y8dn5ouAJrj6HuF7M0e13aFVEF8thEOjm2sJ41ScxbvzMT8VWDkpZkxKKEuC9fSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7528
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_09,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090152
X-Proofpoint-ORIG-GUID: itW8XVzMmrD08-9WvPM0NDy0_4SFA3UX
X-Proofpoint-GUID: itW8XVzMmrD08-9WvPM0NDy0_4SFA3UX

A first early comment.  You are changing the existing implementation of this
quite a bit so I am still tracing through it a bit to understand it all :)

Good stuff though.

On Fri, Dec 20, 2024 at 05:27:16PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  include/dtrace/pid.h                |   1 +
>  libdtrace/dt_pid.c                  |  75 +++++++++++++-----
>  libdtrace/dt_prov_uprobe.c          |   2 +-
>  test/unittest/pid/tst.dash.r        |   1 +
>  test/unittest/pid/tst.dash.sh       | 118 ++++++++++++++++++++++++++++
>  test/unittest/usdt/tst.pidprobes.sh |  18 ++++-
>  6 files changed, 192 insertions(+), 23 deletions(-)
>  create mode 100644 test/unittest/pid/tst.dash.r
>  create mode 100755 test/unittest/pid/tst.dash.sh
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index c53e60047..ad0aad9d8 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -47,6 +47,7 @@ typedef struct pid_probespec {
>  	/*
>  	 * Fields below this point do not apply to underlying probes.
>  	 */
> +	int pps_absoff;				/* use "-" for overlying probe function */

Why use this?  All you do with it is record that func is "-", and then later
in the pid provider, you actually use that to force the function name in the
probe description to be "-".  But that function name in the probe desc is (in
the pid provider) already coming from pps_fun, and the code was already
assigning func to pps_fun, so it would be "-" anyway.  So the pps_absoff seems
to serve no purpose, and you could just rely on pps_fun being "-" when needed.

>  	pid_t pps_pid;				/* task PID */
>  	uint64_t pps_nameoff;			/* offset to use for name */
>  } pid_probespec_t;
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index b8bbb0396..dae499422 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -155,7 +155,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  	uint_t nmatches = 0;
>  	ulong_t sz;
>  	int glob, rc = 0;
> -	int isdash = strcmp("-", func) == 0;
>  	pid_t pid;
>  
>  	/*
> @@ -182,8 +181,50 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  	psp->pps_fun = (char *) func;
>  	psp->pps_nameoff = 0;
>  	psp->pps_off = symp->st_value - pp->dpp_vaddr;
> +	psp->pps_absoff = 0;
>  
> -	if (!isdash && gmatch("return", pp->dpp_name)) {
> +	/*
> +	 * The special function "-" means the probe name is an absolute
> +	 * virtual address.
> +	 */
> +	if (strcmp("-", func) == 0) {
> +		char *end;
> +		GElf_Sym sym;
> +
> +		off = strtoull(pp->dpp_name, &end, 16);
> +		if (*end != '\0') {
> +			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> +					  "'%s' is an invalid probe name",
> +					  pp->dpp_name);
> +			goto out;
> +		}
> +
> +		psp->pps_absoff = 1;
> +		psp->pps_nameoff = off;
> +
> +		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
> +			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
> +			     "failed to lookup 0x%lx in module '%s'", off, pp->dpp_mod);
> +			if (psp->pps_fun != func && psp->pps_fun != NULL)
> +				free(psp->pps_fun);
> +			goto out;
> +		}
> +
> +		psp->pps_prb = (char*)pp->dpp_name;  // make sure dt_prov_uprobe uses it
> +		psp->pps_off = off - sym.st_value;   // make sure dt_prov_uprobe uses it // dump this
> +		psp->pps_off = off - pp->dpp_vaddr;  // make sure dt_prov_uprobe uses it
> +
> +		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_OFFSETS) < 0)
> +			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
> +			    "failed to create probes at '%s+0x%llx': %s",
> +			    func, (unsigned long long)off, dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +		else
> +			pp->dpp_nmatches++;
> +		free(psp->pps_fun);
> +		goto out;
> +	}
> +
> +	if (gmatch("return", pp->dpp_name)) {
>  		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
>  			rc = dt_pid_error(
>  				dtp, pcb, dpr, D_PROC_CREATEFAIL,
> @@ -195,7 +236,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  		nmatches++;
>  	}
>  
> -	if (!isdash && gmatch("entry", pp->dpp_name)) {
> +	if (gmatch("entry", pp->dpp_name)) {
>  		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
>  			rc = dt_pid_error(
>  				dtp, pcb, dpr, D_PROC_CREATEFAIL,
> @@ -240,7 +281,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  		}
>  
>  		nmatches++;
> -	} else if (glob && !isdash) {
> +	} else if (glob) {
>  #if defined(__amd64)
>  		/*
>  		 * We need to step through the instructions to find their
> @@ -449,31 +490,26 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
>  	else
>  		pp->dpp_obj++;
>  
> +	/*
> +	 * If it is the special function "-", cut to dt_pid_per_sym() now.
> +	 */
> +	if (strcmp("-", pp->dpp_func) == 0)
> +		return dt_pid_per_sym(pp, &sym, pp->dpp_func);
> +
>  	/*
>  	 * If pp->dpp_func contains any globbing meta-characters, we need
>  	 * to iterate over the symbol table and compare each function name
>  	 * against the pattern.
>  	 */
>  	if (!strisglob(pp->dpp_func)) {
> -		/*
> -		 * If we fail to lookup the symbol, try interpreting the
> -		 * function as the special "-" function that indicates that the
> -		 * probe name should be interpreted as a absolute virtual
> -		 * address. If that fails and we were matching a specific
> +		/* If we are matching a specific
>  		 * function in a specific module, report the error, otherwise
>  		 * just fail silently in the hopes that some other object will
>  		 * contain the desired symbol.
>  		 */
>  		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
>  					pp->dpp_func, &sym, NULL) != 0) {
> -			if (strcmp("-", pp->dpp_func) == 0) {
> -				sym.st_name = 0;
> -				sym.st_info =
> -				    GELF_ST_INFO(STB_LOCAL, STT_FUNC);
> -				sym.st_other = 0;
> -				sym.st_value = 0;
> -				sym.st_size = Pelf64(pp->dpp_pr) ? -1ULL : -1U;
> -			} else if (!strisglob(pp->dpp_mod)) {
> +			if (!strisglob(pp->dpp_mod)) {
>  				return dt_pid_error(
>  					dtp, pcb, dpr, D_PROC_FUNC,
>  					"failed to lookup '%s' in module '%s'",
> @@ -647,9 +683,10 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
>  	if (strcmp(pp.dpp_func, "-") == 0) {
>  		const prmap_t *aout, *pmp;
>  
> -		if (pdp->mod[0] == '\0') {
> -			pp.dpp_mod = pdp->mod;
> +		if (strcmp(pp.dpp_mod, "*") == 0) {
> +			/* Tolerate two glob cases:  "" and "*". */
>  			pdp->mod = "a.out";
> +			pp.dpp_mod = pdp->mod;
>  		} else if (strisglob(pp.dpp_mod) ||
>  		    (aout = dt_Pname_to_map(dtp, pid, "a.out")) == NULL ||
>  		    (pmp = dt_Pname_to_map(dtp, pid, pp.dpp_mod)) == NULL ||
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index acf1c914f..ae4b262ac 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -735,7 +735,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	pd.id = DTRACE_IDNONE;
>  	pd.prv = prv;
>  	pd.mod = psp->pps_mod;
> -	pd.fun = psp->pps_fun;
> +	pd.fun = psp->pps_absoff ? "-" : psp->pps_fun;
>  	pd.prb = prb;
>  
>  	/* Get (or create) the provider for the PID of the probe. */
> diff --git a/test/unittest/pid/tst.dash.r b/test/unittest/pid/tst.dash.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/pid/tst.dash.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
> new file mode 100755
> index 000000000..996b79f4f
> --- /dev/null
> +++ b/test/unittest/pid/tst.dash.sh
> @@ -0,0 +1,118 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +DIRNAME=$tmpdir/pid-dash.$$.$RANDOM
> +mkdir $DIRNAME
> +cd $DIRNAME
> +
> +# Make trigger program.
> +
> +cat << EOF > main.c
> +int foo0(int i) {
> +    int j, k;
> +
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +
> +    return i;
> +}
> +int foo1(int i) {
> +    int j, k;
> +
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +
> +    return i;
> +}
> +int foo2(int i) {
> +    int j, k;
> +
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +    j = i ^ 1; k = j ^ 1; i = k ^ 1;
> +
> +    return i;
> +}
> +int main(int c, char **v) {
> +    int i = 0;
> +
> +    i = foo0(i) ^ i;
> +    i = foo1(i) ^ i;
> +    i = foo2(i) ^ i;
> +
> +    return i;
> +}
> +EOF
> +
> +gcc main.c
> +if [ $? -ne 0 ]; then
> +	echo ERROR compile
> +	exit 1
> +fi
> +
> +# Loop over functions in the program.
> +
> +for func in foo0 foo1 foo2 main; do
> +	# For each function, get the absolute and relative
> +	# (to the function) address of some instruction in
> +	# the function.
> +	read ABS REL <<< `objdump -d a.out | awk '
> +	  # Look for the function.
> +	  /^[0-9a-f]* <'$func'>:$/ {
> +
> +	  # Get the first instruction and note the base address of the function.
> +	  getline; sub(":", ""); base = strtonum("0x"$1);
> +
> +	  # Get the next instruction.
> +	  getline;
> +
> +	  # Get the next instruction.  Note its PC.
> +	  getline; sub(":", ""); pc = strtonum("0x"$1);
> +
> +	  # Print the address, both absolute and relative.
> +	  printf("%x %x\n", pc, pc - base);
> +	  exit(0);
> +	  }'`
> +
> +	# Write the expected output to the compare file.
> +	echo got $ABS $func:$REL >> dtrace.exp
> +	echo got $ABS "-":$ABS   >> dtrace.exp
> +
> +	# Write the actual dtrace output to the output file.
> +	# Specify the pid probe with both relative and absolute
> +	# forms.
> +	for probe in $func:$REL "-:$ABS"; do
> +		$dtrace -c ./a.out -o dtrace.out -qn '
> +		    pid$target:a.out:'$probe'
> +		    { printf("got %x %s:%s", uregs[R_PC], probefunc,
> +							  probename); }'
> +		if [ $? -ne 0 ]; then
> +			echo ERROR: dtrace
> +			cat dtrace.out
> +			exit 1
> +		fi
> +	done
> +done
> +
> +# Check results.
> +
> +if ! diff -q dtrace.exp dtrace.out; then
> +	echo ERROR: 
> +	echo "==== expected"
> +	cat dtrace.exp
> +	echo "==== actual"
> +	cat dtrace.out
> +	exit 1
> +fi
> +
> +echo success
> +exit 0
> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
> index 54444d49b..e3e4e2043 100755
> --- a/test/unittest/usdt/tst.pidprobes.sh
> +++ b/test/unittest/usdt/tst.pidprobes.sh
> @@ -121,7 +121,13 @@ fi
>  pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
>  pc0=`echo $pcs | awk '{print $1}'`
>  
> -# Run dtrace.
> +# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
> +
> +for pc in $pcs; do
> +	printf 'p*d$target::-:%x,\n' $pc >> pidprobes.d
> +done
> +
> +# Construct D script:  add a glob for all pid and USDT pyramid probes in foo.
>  
>  cat >> pidprobes.d <<'EOF'
>  p*d$target::foo:
> @@ -130,6 +136,8 @@ p*d$target::foo:
>  }
>  EOF
>  
> +# Construct D script:  add a glob for all USDT pyramid probes, dumping args.
> +
>  if [[ -n $usdt ]]; then
>  	echo 'pyramid$target::foo: {' >> pidprobes.d
>  
> @@ -141,6 +149,8 @@ if [[ -n $usdt ]]; then
>  	echo '}' >> pidprobes.d
>  fi
>  
> +# Run dtrace.
> +
>  $dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
>  if [ $? -ne 0 ]; then
>  	echo "failed to run dtrace" >&2
> @@ -286,14 +296,16 @@ fi
>  # - a blank line
>  # - pid entry
>  # - pid return
> -# - pid offset
> +# - pid offset (relative -- that is, pid$pid:main:foo:$reloff)
> +# - pid offset (absolute -- that is, pid$pid:main:-:$absoff)
>  # - two USDT probes (ignore is-enabled probes)
>  
>  echo > dtrace.out.expected
> -printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
> +printf "$pid pid$pid:main:foo:entry %x\n" $pc0   >> dtrace.out.expected
>  echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
>  for pc in $pcs; do
>  	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
> +	printf "$pid pid$pid:main:-:%x %x\n"      $pc          $pc >> dtrace.out.expected
>  done
>  echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
>  echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
