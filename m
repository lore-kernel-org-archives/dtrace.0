Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC04305E28
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225574; cv=fail; b=sK9WLUmC9ZdeKjMegspyh01mlYAuwMVx3ykKDRAtJ3H0x2v7miL+beEDAZQE0H1eMZpWmJSgWQfHhFA8uGmoioMTG1G55xzAo5LpJn1ygbsm+wqdepfR0j+kXrRncPENprBNg5H4RYxaAxyLDuDU+lNSaT1/45De1Snc923M7O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225574; c=relaxed/simple;
	bh=WwOpWTPBs9nys0DnYwkq0LebST4Md3gf+YJbx19mix4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=s1kGzFpmbgubFrmYPVUodEqV5jJLf72txrpPu7ROyTHwzYKyy8ecV+Ynvg2WpAAvzd9Awoa6BN6YMtLegdYc2vZQiyEUpcyilmUJtdcQVn0pO/iS09trxg03qP71Dmwj3wqvgpzsHmYnaIhR7GRtKmjhPpmdjmHu1MrG9uLzD9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M0JP8PyA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PsFsfnfN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M0JP8PyA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PsFsfnfN"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IGqJE6031627
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ZAnmQmPfCSU3XEliyT/crfi1msKs6r2OecXf43Yb6/0=; b=
	M0JP8PyADojRHZrc7GtvMLHch/ZWinUst/07XKzvHUr8hwIq9IW+dHzMbJFDWUqK
	/BlfVDUjC+Se4rI0DB4vj0NNDX38aXzntv/WifB5BdcPC6IySLh93vmj+TCQUcKu
	6FXNCi4oOmjK9aUBSiVgFuWuKhq9sKXHYXc014W7VvF8L2l6L5KtpyKK+BbrpqVW
	+/9TMG/Op2+zduzjcLVrThdAr9H4AyN7dFEI7rs+kgaKyl3zmnsbeBFgKCk2BPAN
	1rK6Ne6mwFWyuiGxgrpPBCxC51xuvvwQYEgs4eD9YfTAJPg1iQ2xAjYQxeFpT2zN
	cMY6uPO+ARpF4hCnO7Viyw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx8m54h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:59:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIcqUp028762
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:59:29 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fna79-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 19:59:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFGw/aa4qJNwZCyK5EJJzT/kRJgfuKs2VhWtH4krgRsDO0EHyYdoo6QwoGi2XJqyIOgt1t4UaAhISdElvVRJ4Hknl7BuOiv+u4uDbuSQ9lVjU6uyZ9rWLtEVRdMtnZhvJwCjNUYcTehSgZ/I8Kzxp/QjDXhiMw/8dkhY3P6p7KSMCyenQo0gM8Xe2syvW9SZWv1AcRsVWxNmQGIZ4tknw3V/+YFU/lclkvzqMfuAntJ3mjYhaGtDQDkRH5hqdXP6WIVNwnDp9LiaK6EqjLsa5yblasdMiS+Nsd+75whzHxS4lMyvVI2qksJ+AXYu2bAp8LAqCrBR00+T/vdU9vEdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAnmQmPfCSU3XEliyT/crfi1msKs6r2OecXf43Yb6/0=;
 b=XZCw+zSbXECghPoPoy7iKswxKXHFkvOXXFD9n/fQng+MnNgjgxfm9KAQKdXKdyeTS5OCdVfSpGO4CtZU3Rtnl34uEpWtfCvKOaocytTcogUPinOYnURqNl72D9CN0F2qeafUjqvkFnrcP+51No23jBxbyJVpyGdWmapTyu+Pf6+YFnAypr3cl5DoAHbBmuwYO1YUM/BZ1sgFlvVYOrsYZ5zJupVSyfnt212EczFg65gWiGaQ6riRQkTke627QoLyF0ZA7X5SElg7si67lxI0xYsD+CroLeOO0JPlLN9HLOVDevN5R4jyWdcgz0DiPS90W4l7JEgTXe26fOKzkT2Ycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAnmQmPfCSU3XEliyT/crfi1msKs6r2OecXf43Yb6/0=;
 b=PsFsfnfNAjZFt81aqNfEoWc9aBICjJRQYHK3IERb8yhLxb/4MKaci5uW6piMH5CA3TLpqlxp5iqOwb4o0yK9ptD7tqAOtj/+MTmQsyU5bGjOrr2wD4iKWphYW/STPVWNVQtQFCqRYeOU5MMvLuclDhX9tmJzdnAY3f7ti1nzm8M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7398.namprd10.prod.outlook.com (2603:10b6:8:135::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 19:59:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 19:59:25 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] WIP doc: Add IP provider documentation
Date: Thu, 18 Sep 2025 15:59:22 -0400
Message-Id: <20250918195922.2155-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:208:2be::25) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: b2e0470a-947f-4751-9071-08ddf6edde6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yHs+xaAFpEPbrftWRDxVJJD0Q6IfPBzZ5H6EdvvaS7IYTkKWwRpNe/fC9csu?=
 =?us-ascii?Q?B8XHHSqxypvd2az0Ht7VoroWYuRBRjKg3yHuR7oOd0Gyh82SMscyEGXl9Z6s?=
 =?us-ascii?Q?LD7ZbIIfk+fFJ96aa6N+fTUzrn57jk6yoIG282FAcxV421PMcJeLE8YdTZeC?=
 =?us-ascii?Q?AysmlrJAo3HFNF1X/TkFV/5xUnBPto2ZO2c2DPxtNck/tp7h2u4RHXy785iS?=
 =?us-ascii?Q?VUxL1D7wzaaniNVDEYVS0OTWcAhCvDcur6ROm4z/AQFOFQtaKh0KUgJ2HB82?=
 =?us-ascii?Q?C8jAW3dvNQfuH2qPRqsfMkzwCKo7cAmmO+VICWU0vidYBV7gLK/1lWLHczwE?=
 =?us-ascii?Q?VS9Zgm6MvnKLSgJQy0hgtDKPsXwHzTcY3iZxZcu1MrHfhv9vH/Gb3vIs4lrW?=
 =?us-ascii?Q?ewwrSj8i+LikDN6LmxEJdlTXraqmJ4LSDxXEyeYzd/wkNLyw+hRCUkLdUkfS?=
 =?us-ascii?Q?xP5x6SdIKcvUTFR42pUg8gzJleUkdgLovWncLb3bKKmHI2s+C/CkNYJFKXgJ?=
 =?us-ascii?Q?D7BCGbcrIcuPBk5E0pAfy/sEoLDKoEBOAtPdFNFpFVTnRkPtdXtHX/AxTndG?=
 =?us-ascii?Q?ERfUpb0FwuD6qIRtEgRKeS/MFXA0U+jBuWPP8PFYxAKcloDOujGq99z/0G89?=
 =?us-ascii?Q?Wf3PZB93oSiemnramkDBsayoN1ox8j07+2x7GY7nlM6Cdr2jTCIQN4dWCeD+?=
 =?us-ascii?Q?uxIbvG+EkZdtjP8glpoNYoSrd9jWq2UiVZgpPRrUkKbTBl+M5DlMVVUocTeL?=
 =?us-ascii?Q?E8qDNEBUvate0+7gpuxOJDkskxbwLXxJeL0TTThFS7EIzARtvdYeXN1aHBh+?=
 =?us-ascii?Q?//i+cN0OZkIe8rX0ujs2A23DksdqMeDj8ybNsR2fqZSMzY7cjx0DT4pnwOMy?=
 =?us-ascii?Q?VfOQPgwdKtYHJoxUwdeRPrw/KgYQepmncTRMHj48ucPXivHwHxWAk0lkMcDN?=
 =?us-ascii?Q?7t37Tnu/uFSQfVbcapT1k6xfuPhQhmJo3i/cvOY6TI8//z0gBLiw9iTFQXOV?=
 =?us-ascii?Q?xiiw/E2+Ua1XlitF0gX+jaP5VGCJ0l5UHly9FoXOnztyTMeXl7wSZ1z8adSZ?=
 =?us-ascii?Q?u8Y95Bgbb+Cti17G8IT65jSfSsqx6UvtzQXKqewJkUnP3VLPj/bkBxeWaGwt?=
 =?us-ascii?Q?PiRml0xiu69d+1z+P1K7zxy+fKptYcGSH5+wUsByra18WLVeTPScn/GMp12G?=
 =?us-ascii?Q?wE7XiGuXSeRfcmQDCQgbsrLOe+n4f63lwTguSzmZaI4li8lixhmYGJtbaL/I?=
 =?us-ascii?Q?tikDRRLsQ4CSjGjyvVj+A1VJshW12+hSM11Y/kq6OOvEbYwvanIWH/od00Nz?=
 =?us-ascii?Q?tbaprfS97iUxe7Dwmsl7Uumw+BmpL3gfnFniIQ4L4bBGGbEvjSApaLZvUGrM?=
 =?us-ascii?Q?cDbm6hWlBw/eJk6k3gGsMbASymzdrbm7FPgRQhw4k9MMQ3P+6Uo9TWCJaNSZ?=
 =?us-ascii?Q?VuayKmITMx0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/kCYWR2sDvJBC708XBXZvxh+fWnCKkxthIltkbR2l+bQWot3Ht2UM5WGc1jd?=
 =?us-ascii?Q?DBwRRnMo5S/0UbkDPuwmSFORCofL+WX4NSEMDGo/cbN8sih0LJ9X4CQnCNXA?=
 =?us-ascii?Q?XbzzSo6Fq3F+iSFjKQkScjp9488b+Bs1kIzd7E9VsLMSw8AOeePgURIBxSyJ?=
 =?us-ascii?Q?RUzSUTiWrVMIhPyGjnomACdGpMe2AJoO2Nu69zNE4EX1HB2A+BDEzUgfcxm+?=
 =?us-ascii?Q?0Z0tMSO6XegLCYJfcmkvLub15IHYVAO4a8mGML39BbPnYsJsmSMNidAvQrlk?=
 =?us-ascii?Q?PMMXLCzRusCoIPcfDpHMJQ1jrNsAtoQGT+tEiRsywjh69wf0atDY/gjcQ+RP?=
 =?us-ascii?Q?UKl6yE1nsHyXBk3s+pVRLv2ATmNdLtbPOgmAeHyAg1Vgt9zE2I+SjiHXJVs5?=
 =?us-ascii?Q?0xU51U6P7qz/H6Dt7Xf7DqdBKM+iC6hYEcHmLp3RfqAqK4SNPunMOsR9Z/H+?=
 =?us-ascii?Q?zgMFQNVKvegQEVPrOMbiEJ8+RVW1mPNFLQ9sMS1cd+g/3a0uBO1G04ARK8Ho?=
 =?us-ascii?Q?aoZ23bOWo8NnbcAbUJE5Qif448luKdxg3TrzRKB5gRpGe8M3xjmTvsieQ3Ev?=
 =?us-ascii?Q?BERGlDAFaIOl0sxn0qYdRLJXrWO0zL3gvfwIOak4RM5Mb6YklFBiDSETA8Fx?=
 =?us-ascii?Q?GPXJagKpYYgyETfaRUmz6adTfwiQWXxPg3WYuN70v8WXafLP5qaBxHXc96gg?=
 =?us-ascii?Q?oipqHm7I5MPD+9qRHa3PYHbbGL24b6ZzoyPYCNdKd+FMao3xvQTQ71ZTMF+b?=
 =?us-ascii?Q?qhqIbzJUGJAJ1NCJ76KXiNWPkRYmcf+SRy2GInleROfXXTGcego76dtmlA12?=
 =?us-ascii?Q?FyxxFS1Wyv5vpgTfvvbEEzPUhoDMISW/AYxVggxeooIKYYtmii/U0K/AweAI?=
 =?us-ascii?Q?Pwehk8asyfcZoF1fo5BadpC6aMo8+cBYU/W4X49wmAj04UaZdBwS97KKBDhQ?=
 =?us-ascii?Q?ojx+EiEOk1CMFYU+H3vZeldwuJke41npoD7p1TH6y6cqQyH14Tn45PgRofwN?=
 =?us-ascii?Q?EKXumtGYotnoQ/NKin/sKWYQGLsh0o9ztVg+ucQcfTG9guRqUUoDy5ySm0jm?=
 =?us-ascii?Q?5+lYR0lwGKO2cSCDoXZWMlqwnBXigJXfpAP44Px525Xmgb99I7gETMamGgWb?=
 =?us-ascii?Q?TaATxp6w23TyMKyjnR1jnjQwlI+Gok9VCnhZcCbug62hiftW52GogsRmh6ry?=
 =?us-ascii?Q?d3fmBnPS8lrncKoW5TaTYXtUcSrhodwapegYSaZlmoBqKxs7hmtQXEUpus02?=
 =?us-ascii?Q?6mfb5LUZhDycBbvWtXmm5g8k2WUAscrab2mYx4dA+O97+qVj0fzfobyvLUVG?=
 =?us-ascii?Q?QakkWT3y+TS00hikemfYCPnefdt9fVs9/faut6gMTyhbyA1SGf04ppDKRnOL?=
 =?us-ascii?Q?WkOQNnDHtDqNeFhv/pfDCqcVeaGApIH19MiYuaKrJOlWNpNkGeKte6ynK0RD?=
 =?us-ascii?Q?DNws0ohpwKnbohgTkpTtB3C6T9G4tebs7LJ/hsnn4wlgsMq1KLGrSXdTPvmd?=
 =?us-ascii?Q?YzRliYyDTAJxMgR9MetaAoWqIBUxe26FxcjoXyk2A6uk37jF3q01ydTQeueZ?=
 =?us-ascii?Q?fgUasOwLUB4G4BwwjmvWiEMZ4QGmvvzK8w7CsN6Q?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L+aGqBBc+uTPhlCAxF0jt6d+iWg7havT+Yf+9hUZsooBOCDTLPn/g9Y+3jrBY1gievcwVDWGNCqHQH8P1WnyQtPlMQvSA3/lr82HcBOLNCC/L6YmCBPpQmnsNI3HYJ+Dwef6jWcV/JjBMAfWWh+XYXRcnQNqzZwcFnanOPahJJxesxN3EeTusRUytMwbuV8jX4Nacg8u8afA27g0IKGSY7q6qt3AKItYavQiZwubae51mof63gaWaV28/jfuUGbikNoM+OHFmccwHTELsMl7Mx/WL2o3X90EWDe9+j+gD5aP1fv2eb6XPhHAjoYSx4Ki12PLMPlajnO2KLZCWfucZjsFzdlIr/TOtFaLca08s0Fvp/6DvRFZAZirZ6Tf8ZA8JiRwwrR4SnG4qF+r91pZpKOqpw2UKJS29cnXn3awo72H+CAEjtJKOc5zZUHEbNyHODCG5s31plHKhhI9WD7/9CbZH8ERMe2C5ATq4sUMKPsHKB8Zn39C8pmvAICcUh27SwBfit9E8EiyN2NZQui97hpVY650ZLdVcL+Swr8nptYy+PFEAW1FUE/l8jvqFynCTWCTaHE1resCVZ/R62dLHGtAy1qBRw146rBqDBSFP18=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e0470a-947f-4751-9071-08ddf6edde6f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 19:59:25.8429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9H6nVj2GdJjXb7XlPIrlR1N0QalkWOqXBqROoPwYG18fUBjLgTmwfq4maUlCAZ3jdnA6uW7L0sat3/u8M5Sog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7398
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180178
X-Authority-Analysis: v=2.4 cv=JNU7s9Kb c=1 sm=1 tr=0 ts=68cc64a3 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=pSgiNiDuFS_2RYNtrc8A:9
 a=MABqqF4FgsRPr8lW:21
X-Proofpoint-ORIG-GUID: 7owTqbwfU7NIXGUJx4GbtkGOaL5qUYPu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX5PU6YfHcBCRM
 qzPhBycRCOVtl4KD+cgI+Vp1K1Vu+oNE1Eqsl3h2/MkYrDRZMZkVMy1fxo7PPHGYEz9JlwzweEc
 v9cumc50u+f3u437Gc/rxEP4fIGryk3oEfQPBmKMqta+nCTANPvT36KJnXNkggyJoNdF9CWme/O
 bUT60pw7JP5uK/wlwplMOpAFqjzMzgnXY2/F6gcflfc+uvKaoxOJA6OPNI6tQ9wVJqVBoxCyHhg
 NN+IHhmv7t4y0oATa/5TsoSuJfqZLrA4s5yeBJ0GEb5C5XMmaZLatQqQqgOF0c9NMjwolyQDm9N
 Bmm1dIAOjOWp/J72GNDCnT52jZByWk9f1xlksrMb7nH9cFWAP5c7v6hfzG2XkSoknfOWSpuqUjP
 hTkMoiSl
X-Proofpoint-GUID: 7owTqbwfU7NIXGUJx4GbtkGOaL5qUYPu

From: Eugene Loh <eugene.loh@oracle.com>

I'm starting to add some provider documentation to the MD user guide:
ip, tcp, udp, and rawfbt.  This is my first cut at editing the MD UG
and I'm pretty unfamiliar with the ip provider (and tcp and udp).
So if you want to offer preliminary feedback, feel free.  Otherwise,
I'll do those providers and then go back and look the whole thing over
more carefully before posting for review.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  10 +
 doc/userguide/reference/dtrace_providers.md   |   2 +
 .../reference/dtrace_providers_ip.md          | 177 ++++++++++++++++++
 3 files changed, 189 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_ip.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index abd1096db..760867eee 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -208,6 +208,16 @@
             -   [fileinfo\_t](reference/dtrace_providers_io.md#dt_ref_iofile_prov)
         -   [io Examples](reference/dtrace_providers_io.md#dt_ref_ioexamples_prov)
         -   [io Stability](reference/dtrace_providers_io.md#dt_ref_iostab_prov)
+    -   [IP Provider](reference/dtrace_providers_ip.md#dt_ref_ip_prov)
+        -   [ip Probes](reference/dtrace_providers_ip.md#dt_ref_ipprobes_prov)
+        -   [ip Probe Arguments](reference/dtrace_providers_ip.md#dt_ref_ipargs_prov)
+            -   [pktinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ippkt_prov)
+            -   [csinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipcs_prov)
+            -   [ipinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipip_prov)
+            -   [ifinfo\_t](reference/dtrace_providers_ip.md#dt_ref_ipif_prov)
+            -   [ipv4info\_t](reference/dtrace_providers_ip.md#dt_ref_ipipv4_prov)
+            -   [ipv6info\_t](reference/dtrace_providers_ip.md#dt_ref_ipipv6_prov)
+        -   [ip Stability](reference/dtrace_providers_ip.md#dt_ref_ipstab_prov)
     -   [Lockstat Provider](reference/dtrace_providers_lockstat.md#dt_ref_lockstat_prov)
         -   [lockstat Probes](reference/dtrace_providers_lockstat.md#dt_ref_lockstatprobes_prov)
         -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#dt_ref_lockstatargs_prov)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 6fd0fec6e..f8e8026db 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -11,6 +11,8 @@ The `dtrace` provider includes several probes that are specific to DTrace itself
 The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
 -   **[IO Provider](../reference/dtrace_providers_io.md#)**
  The `io` provider makes available probes that relate to data input and output.
+-   **[IP Provider](../reference/dtrace_providers_ip.md#)**
+The `ip` provider provides probes that can be used to study IP traffic.
 -   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md#)**
 The `lockstat` provider provides probes that can be used to study lock usage and contention.
 -   **[Pid Provider](../reference/dtrace_providers_pid.md#)**
diff --git a/doc/userguide/reference/dtrace_providers_ip.md b/doc/userguide/reference/dtrace_providers_ip.md
new file mode 100644
index 000000000..67acd52cd
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_ip.md
@@ -0,0 +1,177 @@
+
+# IP Provider {#dt_ref_ip_prov}
+
+The `ip` provider makes available a probe at IP send operations in the system and a probe at receive.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## ip Probes {#dt_ref_ipprobes_prov}
+
+`ip` provides a probe for IP sends and one for IP receives.
+The module name is always `vmlinux` and the function name is empty.
+
+## ip Probe Arguments {#dt_ref_ipargs_prov}
+
+The following table lists the argument types for both the `send` and `receive` probes.
+
+|`args[0]`|`pktinfo_t *`|
+|`args[1]`|`csinfo_t *`|
+|`args[2]`|`ipinfo_t *`|
+|`args[3]`|`ifinfo_t *`|
+|`args[4]`|`ipv4info_t *`|
+|`args[5]`|`ipv6sinfo_t *`|
+
+### pktinfo\_t {#dt_ref_ippkt_prov}
+
+The `pktinfo_t` structure is an abstraction that describes a packet.
+Detailed information about this data structure can be found in
+`/usr/lib64/dtrace/*version*/ip.d` or
+`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
+The definition of `pktinfo_t` is as follows:
+
+```nocopybutton
+typedef struct pktinfo {
+        uintptr_t pkt_addr;
+} pktinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `pktinfo_t` from the `struct sk_buff *`.
+
+### csinfo\_t {#dt_ref_ipcs_prov}
+
+The `csinfo_t` structure is an abstraction that describes connection state.
+Detailed information about this data structure can be found in
+`/usr/lib64/dtrace/*version*/ip.d` or
+`/usr/lib64/dtrace/*version*/net.d`, depending on `dtrace` version.
+The definition of `csinfo_t` is as follows:
+
+```nocopybutton
+typedef struct csinfo {
+	uintptr_t	cs_addr;
+	uint64_t	cs_cid;                    IS THIS SET?
+} csinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `csinfo_t` from the `struct sock *`.
+
+### ipinfo\_t {#dt_ref_ipip_prov}
+
+The `ipinfo_t` structure contains common IP info for both IPv4 and IPv6.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipinfo_t` is as follows:
+
+```nocopybutton
+typedef struct ipinfo {
+        uint8_t ip_ver;         /* IP version (4, 6) */
+        uint32_t ip_plength;    /* payload length */
+        string ip_saddr;        /* source address */
+        string ip_daddr;        /* destination address */
+} ipinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipinfo_t` from, variously,
+`struct iphdr *`, `struct ipv6hdr *`, or `void_ip_t *`.
+
+### ifinfo\_t {#dt_ref_ipif_prov}
+
+The `ifinfo_t` structure contains network interface info.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ifinfo_t` is as follows:
+
+```nocopybutton
+typedef struct ifinfo {
+	string if_name;			/* interface name */
+	int8_t if_local;		/* is delivered locally */
+	netstackid_t if_ipstack;	/* netns pointer on Linux */
+	uintptr_t if_addr;		/* pointer to raw struct net_device */
+} ifinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ifinfo_t` from a `struct net_device *`.
+
+### ipv4info\_t {#dt_ref_ipipv4_prov}
+
+The `ipv4info_t` structure is translated version of the IPv4 header
+(with raw pointer).
+These values are NULL if the packet is not IPv4.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipv4info_t` is as follows:
+
+```nocopybutton
+typedef struct ipv4info {
+        uint8_t ipv4_ver;               /* IP version (4) */
+        uint8_t ipv4_ihl;               /* header length, bytes */
+        uint8_t ipv4_tos;               /* type of service field */
+        uint16_t ipv4_length;           /* length (header + payload) */
+        uint16_t ipv4_ident;            /* identification */
+        uint8_t ipv4_flags;             /* IP flags */
+        uint16_t ipv4_offset;           /* fragment offset */
+        uint8_t ipv4_ttl;               /* time to live */
+        uint8_t ipv4_protocol;          /* next level protocol */
+        string ipv4_protostr;           /* next level protocol, as string */
+        uint16_t ipv4_checksum;         /* header checksum */
+        ipaddr_t ipv4_src;              /* source address */
+        ipaddr_t ipv4_dst;              /* destination address */
+        string ipv4_saddr;              /* source address, string */
+        string ipv4_daddr;              /* destination address, string */
+        struct iphdr *ipv4_hdr;         /* pointer to raw header */
+} ipv4info_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipv4info_t` from a `struct iphdr *`.
+
+### ipv6info\_t {#dt_ref_ipipv6_prov}
+
+The `ipv6info_t` structure is translated version of the IPv6 header
+(with raw pointer).
+These values are NULL if the packet is not IPv6.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/ip.d`.
+The definition of `ipv6info_t` is as follows:
+
+```nocopybutton
+typedef struct ipv6info {
+        uint8_t ipv6_ver;               /* IP version (6) */
+        uint8_t ipv6_tclass;            /* traffic class */
+        uint32_t ipv6_flow;             /* flow label */
+        uint16_t ipv6_plen;             /* payload length */
+        uint8_t ipv6_nexthdr;           /* next header protocol */
+        string ipv6_nextstr;            /* next header protocol, as string */
+        uint8_t ipv6_hlim;              /* hop limit */
+        in6_addr_t *ipv6_src;           /* source address */
+        in6_addr_t *ipv6_dst;           /* destination address */
+        string ipv6_saddr;              /* source address, string */
+        string ipv6_daddr;              /* destination address, string */
+        struct ipv6hdr *ipv6_hdr;       /* pointer to raw header */
+} ipv6info_t;
+```
+
+**Note:**
+
+DTrace translates the members of `ipv6info_t` from a `struct ipv6hdr *`.
+
+## ip Stability {#dt_ref_ipstab_prov}
+
+The `ip` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
+
+<table>
+  <thead>
+    <tr><th>Element  </th><th>Name Stability</th><th>Data Stability</th><th>Dependency Class</th></tr>
+  </thead>
+  <tbody>
+    <tr><td>Provider </td><td>Evolving      </td><td>Evolving      </td><td>ISA             </td></tr>
+    <tr><td>Module   </td><td>Private       </td><td>Private       </td><td>Unknown         </td></tr>
+    <tr><td>Function </td><td>Private       </td><td>Private       </td><td>Unknown         </td></tr>
+    <tr><td>Name     </td><td>Evolving      </td><td>Evolving      </td><td>ISA             </td></tr>
+    <tr><td>Arguments</td><td>Evolving      </td><td>Evolving      </td><td>ISA             </td></tr>
+  <tbody>
+</table>
-- 
2.47.3

