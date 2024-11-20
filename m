Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A50824A0
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130616; cv=fail; b=EQ8Mc6OnrgDQ7ea1asB5zxAGnAFNA9PlBbHUZ1eX4tGKgYfqh3+woWJsaFp7ZMGB9nvzTPiOtfOYjMgRr6meJ3CjYR9XSET8ev+59PloBf6GSJUyoCtx52qDB2/csEeULm3945LqE34FQAHAw2eLMouLgQOBI60E+DKXOrygemg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130616; c=relaxed/simple;
	bh=4P9gNYK5nKyx60Tpl1fjRnxqm5vFr9WYq8eh30oyuAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gk0P5a2WPBiOCPlz3QZ3tXeg0edn2EMI2vbgSSafk4/vx76VqGQFh/dgdB4KFUW6DKdAkClt2hA9qMdcceulTY/zlsvBVkKk6xbjneSumwjxQP83fUtXP/77Df+mHtQU4CH3diQKu12feMHBYH3QFLpdeycKtickq3rXfrRIbCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b/sppFy9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i05w09US; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b/sppFy9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i05w09US"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKFtWX3001507
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=CMFF7/1KpSFqu/Gwzh
	f7MReFLWqE7sxUrXPzbQ6UQyo=; b=b/sppFy9OkVesVtANpgL8OgnzzLTVbn23W
	CJxEtocebru9wi6wyaOvNrlClEiL7Rtb9OAYgTHmR8oJILfR6ghFUvVAdWMEB9+N
	wUWGhbs9+2hFOhZUSz6ZvUTDKalW9IcocchTphAJRjs7kyEH/RWGuBP+veDhWDxe
	PoK8qyzQnrglhMecKHujZd31MC7JBa1+iPZjBlmEzSr1EIIQAGaFXQSwApNMQ1HM
	J1VCWZ16j3YmG17Gy8ZhxlHcUM/60zlvNCBowgAsp0qMKLGxahiqQlBwAQ0KjRns
	4zC9iPGGZvQGw3P9H6tv8QEMFUpJHsEvuY15+8o0hr+0mpZ13/BQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xkec08d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:23:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJM3kN008942
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:23:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42xhuargut-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 20 Nov 2024 19:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDHlgGuEMvy+0o4JSo7u/gGqSA/o8S9iHE86NiOxUfeShKcoX2+SuplRV8xk6l5+c1EdCxoSeHqnf3c+0OmiTKnZepkXsOPJFkwRlBJdj4682BrKDlLuo6602RQfNPS9hGjEgatc8IKWIXXKToy79BZanYCoirLZPmvOk8+tm8vWeERDt4vYQmmTBSr4TxOw470619KO38o/uswtPp1W8jTgtkhQKEfj21uVlSSgPDlJjM4+D8vupcQdDtGXCIK3OiZLrhaS2651jZ5X4Xk/pvu/lFXPT3HxwkM2pFYsljUrfAPt7VGh2e9ZCZQpRb3NKQr0geOanNtXzIHYyHVsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMFF7/1KpSFqu/Gwzhf7MReFLWqE7sxUrXPzbQ6UQyo=;
 b=CuSWgEnHx1r5ftwBzUu0qAQP0I5nVmHvq94Q6rsILjPidpjs3NAp8UBZ5aj/n0ix0v6LelBOu9Up6uxJ9XmXJZmfN13J16k0cq8VrQnXEjIILS9WzMxhGS3+umy6LQy3xnyQH1MmLhfVIjtOToHpgnnprAsRyCrgJj+wYhm9a1pCjkQL/317JqLdlYLR3aSPjQNnCBqrIbqPsa0Hr5qqsKWLLe/Nppo3mj7aCl8R7B54JBFNgeXrAw8vbdV6Jh3B8XMy3vXDrsKW7WDIPdwIf7LJwOUmvGnXDtzeuzdwSgnrWTn2Fjt43UFrg5f+/u3qK3W4JNUUCx3esQEsmf0uzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMFF7/1KpSFqu/Gwzhf7MReFLWqE7sxUrXPzbQ6UQyo=;
 b=i05w09US0i+BNgCgoaVv74VfPeLgtJAXDPXUiboK5HCvFF3fsy9IJ2VzQQR2TtHr9Dsfr4EEeHYH+uaPDyYj24I3THioxW/AjLibfwVGB05O/ZQt7jUDJZzXY0GmzGD/4E2HD7BYa1YNs/8QzOglr604rXj356OUvUdYbrRzCxM=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by SJ2PR10MB7057.namprd10.prod.outlook.com (2603:10b6:a03:4c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Wed, 20 Nov
 2024 19:22:59 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8158.021; Wed, 20 Nov 2024
 19:22:59 +0000
Date: Wed, 20 Nov 2024 14:22:56 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] test: stack_fbt
Message-ID: <Zz43EAAB87FOttWG@oracle.com>
References: <20241107232841.28752-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107232841.28752-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0425.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::10) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|SJ2PR10MB7057:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0004ce-ee99-4332-5cd6-08dd0998be88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wlU04+cy/azSiRr1LWz28+CE3Kev84lKcJcc4jy7Ay6GAiS+Oks3wWVPcJ72?=
 =?us-ascii?Q?FxZUgi6qMF2pgeV+2STYhpDPGMTCdmei4nrl6Uy5CrsVz3t9nuv7e3vGMG8F?=
 =?us-ascii?Q?k0TE94O6xqh0zzxzzZjE9gW4Y5ZhHqBarZOnfN6pbqgCXSjtOCgb4f3mpReu?=
 =?us-ascii?Q?WjELLETtO5W4KeE9hb7U0csYjQUKr4iWi/ItLsDu3UeHdMqyfTTe4LkUjwaU?=
 =?us-ascii?Q?P7VvGcvABxecVgGqIoUl+2/s8j5QG3Zc9jklBpGgCM6Y6GFrcRkSrDZFac3G?=
 =?us-ascii?Q?kLJT4Jv3oVrRjQwAwStlpFK2GJLF1H4EOD1MGQi/66dXGtGGkLjADtBPprN4?=
 =?us-ascii?Q?8wtXtny5rAzw+8mlfxzXQysahq4GplTywq46rSeWhz4uoi0MTRBu9cxG/ONc?=
 =?us-ascii?Q?fT1l3TqPJ7Yl3b/C4Bb/Gi2EUoPAbCOulPpgocE9aYGFwU0PPaxc2jk+qlAA?=
 =?us-ascii?Q?GEePWyndGRpQxrj3xLXIxsHVPZ5pD9KxdV0tyu0DLGq7uOwWIdL7VOYAp2NK?=
 =?us-ascii?Q?ikv0N4fcZ4QHPJoRx1EL7V+yxExuB0CpYOCxqcsZ6hKRQerdmeu1qNHGojpO?=
 =?us-ascii?Q?XQpJEHqKmOuueqxiipae1teCo+dO54OE1yiSXxJFJWDqFcKcXAGfAHiBbIY5?=
 =?us-ascii?Q?ihQDvgDNHsEk9y8TNLTEDCCjpIMbEA3qUbhfVau9btvuqPwyLryjI8xkhED+?=
 =?us-ascii?Q?NOLW2trFwvkJhoJywZ13IUh5Bgy8SH+Lw9wquGeQdhbUvvbwC9P8HxfrSruA?=
 =?us-ascii?Q?gDKEvpnWxsoIHp7dniEgK2g//ota7zTHZqxFmMkCtaBFjwwuU1Nqp30Vwm6z?=
 =?us-ascii?Q?0hUr7q9ayUirlJe5pzaKkj++orRdF1ht4GYK2Dy79W4CMVlUzt3KNnvad+Ii?=
 =?us-ascii?Q?nj8KwEaxGK6qqpzcsk+ELMAxPlJrjMuDXD7F1Xavx5NBYvNS98OCaj8h3z3D?=
 =?us-ascii?Q?AuU5ebJHDB8X4nxi0RzUiMJ2femPZ3bOqBgZx5bNdD4AIh3o3DY1OqP0Zuhu?=
 =?us-ascii?Q?YiPCu3k5IFIT63/meKAga6z2+I1NgyLBY7J2PeX+KEeHeXhMUxfga+LKOG5g?=
 =?us-ascii?Q?SeDEIzFN3JH82RQMRDoY1aquuWQEQmRqEoJ851Eins5tCCW6rWDGPEF9fpCA?=
 =?us-ascii?Q?VOCwuQvYAuFfo8Ap64vOlm7v9I0/wIZH0/lG1xGewPUkDfaIdmD1wChcKjlQ?=
 =?us-ascii?Q?ZCpOmNeW5cNHjOZEOhBqqJcOF5BRa7KYI4aQB2HP3HKBctZROFxJ6JqRT3AQ?=
 =?us-ascii?Q?ckqbHEiA7HBx5pxgdEi8kuRfTl8x5NN6c5wlM8fKcbKWgwAEGQyqId3QOIr6?=
 =?us-ascii?Q?gbzYInXWWcWHkMKN2OroxZPu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nJZSKAId/vCsbUVeS7sCe7eOdIGPkImV4eWeYn4E4HUwjTz72eyOEQu4zN2f?=
 =?us-ascii?Q?a+c0yaGVCDtORtU7jFCQCbddvzfyrwTXwW7j9SkJ+m8GAM7mDi+pXkWBzKKj?=
 =?us-ascii?Q?WNCmcUvL56Efb9bum5gQTNFDqgY2blLXDEJx2AZHISSFFfSGWlHW61LCOieE?=
 =?us-ascii?Q?vzmS1OW9dcYFWSzLesB6MuyaPbQumISUoG85byOx4bNwfs81rGLo/zhSOARa?=
 =?us-ascii?Q?u8J+hUvOVLQJbNj0j7XYb27FYm30NuvQtHtYBXaS/oCOpn0yWO9I/mxetPaU?=
 =?us-ascii?Q?ZlQBNwlytIlA1PcQH8QydPRdlzpQXISnZHnQG6tGm3dQrKCz3z85lhWcBDCo?=
 =?us-ascii?Q?uk1uP6zP4Qap5PL4CZ6Ud9fxwySLI1aWredq3jUb3yIW6+kGl0X8ulMOXmZB?=
 =?us-ascii?Q?lg2G8IA83xL8Hi2K8n0ltFWh5CvXJRPPwPUe/O2ag4VhBkEAA+llpLrDeqKU?=
 =?us-ascii?Q?0YnX/Hn43HC9DoxxD0HR7v99zuqyzksJuSoLSSlY2TSiq6TEEsBNmS/gtnuz?=
 =?us-ascii?Q?Twqpwz6XMr0LhM67vIea7Ne9AOLPo8vnuradZpGXIFVli5EjJihFLXqPdMjw?=
 =?us-ascii?Q?2AGORt6RojaShY1RlKCXLxCydSsDvk475ZSBXuhjWKh2dtbEChAkSztdNFLV?=
 =?us-ascii?Q?e90z3P4DJiyXguz5Hnz5tBg+XZPjbl2yyLJYMO+IgxhixbN1rn4rOVUGi/k0?=
 =?us-ascii?Q?OTOilHj2AomeUBgyOMaZRGVlo1OcD2MZOFblrkvyvYrY9WY4UTJlYiTAmgVM?=
 =?us-ascii?Q?HNdlOibOwfZmLxwLyiNR2NaGDWpCbRuniYSMelv6SZVb3J2Y/vWTPPkzZanL?=
 =?us-ascii?Q?2ATd3ICKt5DofT3UkUymSwQlEmPUwleR1LSU/01au+t7loffDKbnOMZo1S//?=
 =?us-ascii?Q?eryJnskjc2usyQVNg0OO7GQnzfRNKebvQiskOKqp4ODw4qQhbIOwuanZMG0V?=
 =?us-ascii?Q?YK+WRzseT9rxNNvzRqoaepEXbsELAbOHjpStkR+Hm6WXRz7yv/kCpWdjvRUb?=
 =?us-ascii?Q?o09X8I7InFmF/1Lxyp9E9O/v/YsfOEedN62gg/ubVZa87k1AJ/Yhm+HnX0e0?=
 =?us-ascii?Q?wc2kuKegwS1dmAQjHaot/AOEYSIeyV/BS6e1xYQGT+ZDj3X2WxMzmf1HqNhO?=
 =?us-ascii?Q?nEoGV/bVQ1f6iYmFhlnOBvO45mfWfy/nAvc2qBNgaNHw81zanqLH9+sjnc3T?=
 =?us-ascii?Q?JgWAp8D4SmeSW46qDWuz6d18PsZ6jlxs8rQm89KD+bN13kd3WJ3hpgBv5CC+?=
 =?us-ascii?Q?iONYdYuqvDf4txIBPe7JNP/gbtdVKxbOX78UvS21a8oGAuyApZemmYFOuNjG?=
 =?us-ascii?Q?RwP0CKTeKsJdTzbwJ1A8EwNuUtyhtY78/M0Yd3phPsCKD2F3g2OVyoRZDlXD?=
 =?us-ascii?Q?22VfxTYYhYuMgK8QDT2ieUYnqb7702kDYCuTZkIPLYxLM03vDSvpjuPMBa91?=
 =?us-ascii?Q?BzHNddQrzJB41f6skETVBaD2li/vUzkolLTnBIt1RkFpqUrvk2xKNYDVl9Fr?=
 =?us-ascii?Q?9Fg78dSn7l8aDVlBD1aRAfe7R42qoWn+w3muuJLRsi4OxcWTZ0K2haqCAa4q?=
 =?us-ascii?Q?zlqGcrHx7DHvKsyW/nSvRrp6D/0tE7AL6PeD5Cl98FvTma73tW5GsxrR1O2E?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uVy6dnFPYU+surWLWHjQb2Fr7n37q3ACi/q9NNnwihO75AI7rjYbAbDhBcqVjaP/fHAV3A18ThZxXmI181bZ6qrS24ffNSraOB+yQ3IGuii7hMs5TtxwQVAUIa0FMo8V069T0N6K77Ivad3lYqGFdZCwXQPnOrosXQVyB4JiZkRqWF4pXrdyG1s+yetLskZJq83DkKc8JaLFeQOk0gaVcXgSXuJxyPBHQaEcWWN/JiBZ21joO3E22HAlOJSuo/ofFElK/yRTUrYP29/uuTnJ4MrUF5oEf764OKRs2wA2wvhvwi3DI+gDfxOWRg9cBroTrqVjCZoUVrQmkhh4Akn+oRk8ri0si8KpZaSX8/ksWYtbGT61YxZ+3WG9HJBq9r1TZvqtwHXlMcSdDV7aFWHX5H1xSMU+x/i7d81q2zw2B9rwQ3f6UANynQqqpY0dRT+inYEvBdr0uld9v80tRzU1K80RZjUaXp/cUhNT8lNwcqiEva8WX6dOuctjSMg6pHuleVHJ4iLKHdYai+EiY4mgrbZYwsjGP5feftcGnF8FPnJKGBfb6jwoU9t15+Fg51PK7ICTCje727NWU0COCLsSCyI3I/PZk4fHxOM9nD4qcZ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0004ce-ee99-4332-5cd6-08dd0998be88
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 19:22:59.4635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vu8PGO85uDM8AfUS6p8EsWcdIa7qnigMMarbNNZlTao5+iDuxX6LrzZEsDFYbNql3Kj+vskYKmZBtuv+YwEIIlYziawanx3dELsvx5kO4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7057
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_16,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411200135
X-Proofpoint-GUID: rcWktPz5zRmelHVHKpVHl_91q6yyc0u8
X-Proofpoint-ORIG-GUID: rcWktPz5zRmelHVHKpVHl_91q6yyc0u8

On Thu, Nov 07, 2024 at 06:28:41PM -0500, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The test was being skipped on UEKR7 systems because __vfs_write
> was no longer traceable.  The expected stack on UEKR6 x86_64 was
> out of date.
> 
> Switch to fbt::vfs_write:entry.  Convert to a .sh test, so that
> different stacks can be expected depending both on machine type
> and release number.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... with small changes as shown below.

> ---
>  test/unittest/stack/tst.stack3_fbt.aarch64.r |  11 --
>  test/unittest/stack/tst.stack3_fbt.d         |  25 ----
>  test/unittest/stack/tst.stack3_fbt.x         |   1 -
>  test/unittest/stack/tst.stack3_fbt.x86_64.r  |  11 --
>  test/unittest/stack/tst.stack_fbt.aarch64.r  |  14 ---
>  test/unittest/stack/tst.stack_fbt.d          |  25 ----
>  test/unittest/stack/tst.stack_fbt.sh         | 122 +++++++++++++++++++
>  test/unittest/stack/tst.stack_fbt.x          |  10 --
>  test/unittest/stack/tst.stack_fbt.x86_64.r   |  13 --
>  9 files changed, 122 insertions(+), 110 deletions(-)
>  delete mode 100644 test/unittest/stack/tst.stack3_fbt.aarch64.r
>  delete mode 100644 test/unittest/stack/tst.stack3_fbt.d
>  delete mode 120000 test/unittest/stack/tst.stack3_fbt.x
>  delete mode 100644 test/unittest/stack/tst.stack3_fbt.x86_64.r
>  delete mode 100644 test/unittest/stack/tst.stack_fbt.aarch64.r
>  delete mode 100644 test/unittest/stack/tst.stack_fbt.d
>  create mode 100755 test/unittest/stack/tst.stack_fbt.sh
>  delete mode 100755 test/unittest/stack/tst.stack_fbt.x
>  delete mode 100644 test/unittest/stack/tst.stack_fbt.x86_64.r
> 
> diff --git a/test/unittest/stack/tst.stack3_fbt.aarch64.r b/test/unittest/stack/tst.stack3_fbt.aarch64.r
> deleted file mode 100644
> index 5c8bfaed2..000000000
> --- a/test/unittest/stack/tst.stack3_fbt.aarch64.r
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -                   FUNCTION:NAME
> -                          :BEGIN 
> -               __vfs_write:entry 
> -              vmlinux`__vfs_write
> -              vmlinux`ksys_write+{ptr}
> -              vmlinux`__arm64_sys_write+{ptr}
> -
> -
> --- @@stderr --
> -dtrace: script 'test/unittest/stack/tst.stack3_fbt.d' matched 2 probes
> -dtrace: allowing destructive actions
> diff --git a/test/unittest/stack/tst.stack3_fbt.d b/test/unittest/stack/tst.stack3_fbt.d
> deleted file mode 100644
> index 1a2eaf582..000000000
> --- a/test/unittest/stack/tst.stack3_fbt.d
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION: Test the stack action with depth 3.
> - *
> - * SECTION: Output Formatting/printf()
> - */
> -
> -#pragma D option destructive
> -
> -BEGIN
> -{
> -	system("echo write something > /dev/null");
> -}
> -
> -fbt::__vfs_write:entry
> -{
> -	stack(3);
> -	exit(0);
> -}
> diff --git a/test/unittest/stack/tst.stack3_fbt.x b/test/unittest/stack/tst.stack3_fbt.x
> deleted file mode 120000
> index fe0d493c5..000000000
> --- a/test/unittest/stack/tst.stack3_fbt.x
> +++ /dev/null
> @@ -1 +0,0 @@
> -tst.stack_fbt.x
> \ No newline at end of file
> diff --git a/test/unittest/stack/tst.stack3_fbt.x86_64.r b/test/unittest/stack/tst.stack3_fbt.x86_64.r
> deleted file mode 100644
> index f24c8cba5..000000000
> --- a/test/unittest/stack/tst.stack3_fbt.x86_64.r
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -                   FUNCTION:NAME
> -                          :BEGIN 
> -               __vfs_write:entry 
> -              vmlinux`__vfs_write+{ptr}
> -              vmlinux`ksys_write+{ptr}
> -              vmlinux`__x64_sys_write+{ptr}
> -
> -
> --- @@stderr --
> -dtrace: script 'test/unittest/stack/tst.stack3_fbt.d' matched 2 probes
> -dtrace: allowing destructive actions
> diff --git a/test/unittest/stack/tst.stack_fbt.aarch64.r b/test/unittest/stack/tst.stack_fbt.aarch64.r
> deleted file mode 100644
> index 3a2896c48..000000000
> --- a/test/unittest/stack/tst.stack_fbt.aarch64.r
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -                   FUNCTION:NAME
> -                          :BEGIN 
> -               __vfs_write:entry 
> -              vmlinux`__vfs_write
> -              vmlinux`ksys_write+{ptr}
> -              vmlinux`__arm64_sys_write+{ptr}
> -              vmlinux`el0_svc_common+{ptr}
> -              vmlinux`el0_svc_handler+{ptr}
> -              vmlinux`el0_svc+{ptr}
> -
> -
> --- @@stderr --
> -dtrace: script 'test/unittest/stack/tst.stack_fbt.d' matched 2 probes
> -dtrace: allowing destructive actions
> diff --git a/test/unittest/stack/tst.stack_fbt.d b/test/unittest/stack/tst.stack_fbt.d
> deleted file mode 100644
> index 27db21164..000000000
> --- a/test/unittest/stack/tst.stack_fbt.d
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION: Test the stack action with the default stack depth.
> - *
> - * SECTION: Output Formatting/printf()
> - */
> -
> -#pragma D option destructive
> -
> -BEGIN
> -{
> -	system("echo write something > /dev/null");
> -}
> -
> -fbt::__vfs_write:entry
> -{
> -	stack();
> -	exit(0);
> -}
> diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
> new file mode 100755
> index 000000000..e60c519c8
> --- /dev/null
> +++ b/test/unittest/stack/tst.stack_fbt.sh
> @@ -0,0 +1,122 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# This test verifies the nusdtprobes option.

Surely this is a copy'n'paste error and should be removed?  Or rather, it 
should be replaced with a message that actually states what this test
exercises/verifies?

Shall I make it:

	Test the stack action with default stack depth and depth 3.

> +
> +dtrace=$1
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/stack_fbt.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Use DTrace to capture stack() at vfs_write:entry.
> +
> +$dtrace $dt_flags $nusdt -wqn '

I assume $nusdt should not be used here.

> +BEGIN
> +{
> +	system("echo write something > /dev/null");
> +}
> +
> +fbt::vfs_write:entry
> +{
> +	stack();
> +	printf("first 3 frames\n");
> +	stack(3);
> +	exit(0);
> +}' >& dtrace.out
> +
> +if [ $? -ne 0 ]; then
> +	echo ERROR: dtrace failed
> +	cat dtrace.out
> +	exit 1
> +fi
> +
> +# Strip out blank lines and pointer values.
> +
> +awk 'NF != 0 { sub(/+0x[0-9a-f]*$/, "+{ptr}"); print }' dtrace.out > dtrace.post
> +if [ $? -ne 0 ]; then
> +	echo ERROR: awk failed
> +	cat dtrace.out
> +	exit 1
> +fi
> +
> +# Figure out what stack to expect.
> +
> +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
> +	# up to 5.8
> +	KERVER="A"
> +else
> +	# starting at 5.8
> +	KERVER="B"
> +fi
> +
> +if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
> +cat << EOF > dtrace.cmp
> +              vmlinux\`vfs_write+{ptr}
> +              vmlinux\`__x64_sys_write+{ptr}
> +              vmlinux\`x64_sys_call+{ptr}
> +              vmlinux\`do_syscall_64+{ptr}
> +              vmlinux\`entry_SYSCALL_64+{ptr}
> +EOF
> +elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
> +cat << EOF > dtrace.cmp
> +              vmlinux\`vfs_write
> +              vmlinux\`__arm64_sys_write+{ptr}
> +              vmlinux\`el0_svc_common+{ptr}
> +              vmlinux\`el0_svc_handler+{ptr}
> +              vmlinux\`el0_svc+{ptr}
> +EOF
> +elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
> +cat << EOF > dtrace.cmp
> +              vmlinux\`vfs_write+{ptr}
> +              vmlinux\`ksys_write+{ptr}
> +              vmlinux\`do_syscall_64+{ptr}
> +              vmlinux\`entry_SYSCALL_64+{ptr}
> +EOF
> +elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
> +cat << EOF > dtrace.cmp
> +              vmlinux\`vfs_write
> +              vmlinux\`__arm64_sys_write+{ptr}
> +              vmlinux\`invoke_syscall+{ptr}
> +              vmlinux\`el0_svc_common+{ptr}
> +              vmlinux\`do_el0_svc+{ptr}
> +              vmlinux\`el0_svc+{ptr}
> +              vmlinux\`el0t_64_sync_handler+{ptr}
> +              vmlinux\`el0t_64_sync+{ptr}
> +EOF
> +else
> +	echo ERROR: unrecognized platform
> +	uname -r
> +	uname -m
> +	exit 1
> +fi
> +
> +# Add the first 3 frames a second time.
> +
> +head -3 dtrace.cmp > dtrace.tmp
> +echo first 3 frames >> dtrace.cmp
> +cat dtrace.tmp >> dtrace.cmp
> +
> +# Compare results.
> +
> +if ! diff -q dtrace.cmp dtrace.post; then
> +	echo ERROR: results do not match
> +	diff dtrace.cmp dtrace.post
> +	echo "==== expect"
> +	cat dtrace.cmp
> +	echo "==== actual"
> +	cat dtrace.out
> +	exit 1
> +fi
> +
> +echo success
> +
> +exit 0
> diff --git a/test/unittest/stack/tst.stack_fbt.x b/test/unittest/stack/tst.stack_fbt.x
> deleted file mode 100755
> index 4561df8bb..000000000
> --- a/test/unittest/stack/tst.stack_fbt.x
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -#!/bin/bash
> -
> -read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> -
> -if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
> -	exit 0
> -else
> -	echo "Function __vfs_write no longer exists starting in 5.8"
> -	exit 2
> -fi
> diff --git a/test/unittest/stack/tst.stack_fbt.x86_64.r b/test/unittest/stack/tst.stack_fbt.x86_64.r
> deleted file mode 100644
> index 792ce80ad..000000000
> --- a/test/unittest/stack/tst.stack_fbt.x86_64.r
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -                   FUNCTION:NAME
> -                          :BEGIN 
> -               __vfs_write:entry 
> -              vmlinux`__vfs_write+{ptr}
> -              vmlinux`ksys_write+{ptr}
> -              vmlinux`__x64_sys_write+{ptr}
> -              vmlinux`do_syscall_64+{ptr}
> -              vmlinux`entry_SYSCALL_64+{ptr}
> -
> -
> --- @@stderr --
> -dtrace: script 'test/unittest/stack/tst.stack_fbt.d' matched 2 probes
> -dtrace: allowing destructive actions
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
