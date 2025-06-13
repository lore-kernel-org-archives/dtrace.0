Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623721E50E
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825312; cv=fail; b=Q7FcKJNQdl89ws6pF1TNwHYxMR+fihAspkzTIIVx+d/lI5QcOp2gBuzcDpFQUFQLTiP0XtT2C3FExxzrEcNrudLjAdgsvrCekpuX2FsStZ0O2OlXEbGUKo+qOL/aU7NOy5rEBWWPM4osqABetTT0q9HiK3td+B7ywKE+VQa8N/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825312; c=relaxed/simple;
	bh=OPzo0+q9j6zfZc3ViOWBSgSuezpTcogTzh/PNvJLe9Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=O9SKeJzvRdJkgdLCVc74mBMPFYHJRLMdYXzd2Uda3sr1Zl0GoiK5G8AaPFdZXy15xvmiZJY/hkGyV6MCPoOv0sfygi19DQo7HkVUAxDtLAUW1Ws/Wh7papSoBHNMsu/R8ouw5O0YZ7JQTZ2eQbPMSJkJQNIyCkfY+/eARcQcTH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BcaHDw/7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yqlKqH0U; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BcaHDw/7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yqlKqH0U"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCteER020285
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TlmAp2uLwtsNylTyaC
	vJJrbPb/J7ZJtDSmT/b3ntnuU=; b=BcaHDw/71LpS2ehtj/s1F46frIDxg3w7P9
	QF0uDf1ci5gT4Y8ikm4I2j6HVgX3r2vIIzkFnhJUO6hE7knwRFXNuN03BudSSxFx
	S7Cdtx4EIfyGO6ZjrtlqkewGNnxnSUJ/RctB2qcF7oqZ+A7qTnjH3lCbjOnixqge
	ZR4FzA0u7U74B1kKqTG5Mdo7Ikl/womzHdzwx458r7ibfhbzS8Rq/tosux6QFwUO
	nuZYHuU+/SUA7sklffExgO2/2u/nTYGY9+9XeiUrBtgZAUiwX041orEnlf6oxA81
	3P2GORVZ4ApamO68uoeNTopWJ1uyRAkMcuZGX/mWhGVgF8fEtROA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474bufbmc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DD6M85013420
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:07 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvcr3vk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvgg4dLyJXOel8AIF60ESM0oxpNA/WuME7r/VItdHvrZFj1ItX/7mpJv8Gn1mHy5j5C12CsJvO7APR+tNgTEs+P5F2+OUARMTgDaJkyHWXsI7rIp9Pdg0PFvgzOfJlxlG3WmPIlbmEQYGdzOPhQSETArd7I3PZhEUo2Th4/xym3KY7IDiIyD7hsDDxd54/Ci24lK3jBS1GbJeDZFYEXpdCMRCQY9FSchbFl7jH7mLrnPY2bkruXpFwKo/20+aF9VDnuWTU6uwyKvpaQzQpBDHuo8YE1Y/0LvZLZP3O4BqkYzjzL3SqsIqz0LGwIu7EMO6IPAb6JcpVEHnS6mOHhuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlmAp2uLwtsNylTyaCvJJrbPb/J7ZJtDSmT/b3ntnuU=;
 b=iW553G7xD4EACnk6xtGEmEhfJoU7tWpMor7A1bNPowsItO+N9pvYjZa4SBKlCcHARZ+a8y+t4CybB4ZEWpuYsBNF7/TEWZP5ifBTxGQ+xrXcDjcyex5HjRsgTbLNrul8W76ur01AkLw5knqSPlBP3oMtAmtRkjg2G9RHl+bboh3uRH5E8x3gg0Sp8deOeoEimDWLyKuEpCtHLbydfc2BrhwpJwHpT8dX4nZxYjyTwWmwmy3fxF+SYAmhb607/JO6LSLQTbDqdD5H8kKJU5AMqEKqLtyC1IpP7cgr6BqCZhNa4r+atLBMS6fbBWa8o6gUy9bqK/QKk9pViqEMuWClNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlmAp2uLwtsNylTyaCvJJrbPb/J7ZJtDSmT/b3ntnuU=;
 b=yqlKqH0UsT6Yyy+R1Gj3P9WyKuXywFe5UiLb9D4/1pOaUo7z/F4kjYqTuFbO0XZ7iSLhYSJWaToQVjiPNebX3gyvaPa2om3/LEq23KKf5nENZax1dUZoZfiZfd0FCZqhjxVlETTHXYUi9XEmLe0AfhePT3DWuWyrD4+S4qx41r4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SJ0PR10MB4430.namprd10.prod.outlook.com (2603:10b6:a03:2d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Fri, 13 Jun
 2025 14:35:04 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:35:04 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 02/14] Add stack-skip frame count for rawtp provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-2-eugene.loh@oracle.com>
Emacs: ed  ::  20-megaton hydrogen bomb : firecracker
Date: Fri, 13 Jun 2025 15:35:02 +0100
In-Reply-To: <20250522180118.27343-2-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:06 -0400")
Message-ID: <87o6urd815.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0030.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::13) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SJ0PR10MB4430:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd80b67-fe2f-437f-a7d1-08ddaa877ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yWFOMyzw0qTDGWTNpW2aVETCROo+4rNkrGkvRuHvrO54m1jMQMi+IL1pY0As?=
 =?us-ascii?Q?8L2mVMccXpo9IguRly00bHP2mA6gUpDKzmI5HqO4MsGNE3jCDUB+N8ifidvR?=
 =?us-ascii?Q?qB62PIw5Kae8TGpBUk8GYiuORKw1glSmuLlPnPFJodsjIMBT+z6G1TTPgoKP?=
 =?us-ascii?Q?RLIlhlkFTys2dHyle49iMGEUIL0vdoAY/GH9zGOxFJUBB7lssdb+q6+dI8NN?=
 =?us-ascii?Q?BePGeEXSDFYRfYkMUFyfkWLv2bnW+3GX+009gkbZekbm59t92KZnpmnBgPsY?=
 =?us-ascii?Q?sbWj2j7D1B3DFooliUOnM2CucC0wwPYWpX1Po+S2J2ZuNJ+YFm9v7Tnvn51m?=
 =?us-ascii?Q?HBvehWcJ1RqBbD2fS8JgfxszN2O/5SNw+49Yye08YWfqps0d5GjAdgH5iFM0?=
 =?us-ascii?Q?lJY1e8rMVL1UqopVxY7675MU+oob5lAp8GLeE/KIfi/Dbfn31kyId6e5+OZL?=
 =?us-ascii?Q?o765sPjnM/s2D0iyzDlOA7gtUiFVJxF52zTuvpei5N+5ygfbODoQCf/esJ5a?=
 =?us-ascii?Q?7en82thKLxGhUS5evisG5M3R7OTuBDBczsvVNo0PNKA5Q1sDCxhT31O+h00A?=
 =?us-ascii?Q?dSm3/39fpYWsfbZ+Bqe1mp5aMH+wfZuk23Xce9IPUIN/8HBblwv6LiRgMcAh?=
 =?us-ascii?Q?l4tcHyTf3boP9NlBnJWl1UnPXE7JIeVnHTHv+iw0AbCGXdSaJMiwLpohgnPt?=
 =?us-ascii?Q?Utw/4mBFBqb3SULxtzqGoQlHgrzQwL0jlgX4L9aDzw+2JCozSYJpwYV0qN35?=
 =?us-ascii?Q?2bwhksZPDQjZn6+uiazKJauiqSiuYRhdXNJwqpV8JV++aTvGQtKAk0Sd0LlJ?=
 =?us-ascii?Q?2hoxDJStyjE9TcLdCHDa2MI5ag9qghintAzUd7k8r61LoVuBT9mnC1n/djaw?=
 =?us-ascii?Q?Y3PKR0Te3T0ToQE3icmVOTY9u63RZXne200nO6Y/vJwwgeFMNA54wpfMF1Xf?=
 =?us-ascii?Q?Wq5K+1JDzK/IZxEqbQy6z3fiOyZt5QQ0QOn3MR6WYPrv9QmfWnjBmI24VSpS?=
 =?us-ascii?Q?Cd+uLyQ9qD9TKQKm4tK3JdRB3q5N50SR18WGOzky9z0ZQZ0/G7kykuiRSNAE?=
 =?us-ascii?Q?LTDtsf7GzA6owkiIUj0Dx6Zhzg1ktO1xA9FjboQOE4q8DCwitarim/8LmrBE?=
 =?us-ascii?Q?hm7SaojvUh32VotP1yRvq+pvoQFGgvgRD9bFc3wTwMk/v8VN3dhDcZnX2x+k?=
 =?us-ascii?Q?Vjvuhz88e/AWgixE0hHrY7rLT4RVV/+1KqB26/oEzs1B6zI3lTWeGvgFv+EW?=
 =?us-ascii?Q?wi4Jf4rWE8bAO7KN+MRna+rAkBde1/d5F4TBNpuBuMJtMertTD1oKNSmejim?=
 =?us-ascii?Q?lZpu6gTJ+TvQTewPELXH4PDeolijnkIOf/NMIn0Qgb/Pjx1EnMhup3WTAg0Q?=
 =?us-ascii?Q?xO6duJ37BbLnADcXFjGdBI3mjleivPe/bVSS+piVXO4WDt0hVNB+6kdLheaZ?=
 =?us-ascii?Q?+u2dZKp3gP4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JuBdo1B/G1S64xP4uCIK3JRHUEarBvjFvydzYBKo0kig316B9ZDVqtvmFQ3a?=
 =?us-ascii?Q?cDukkDPNBJQKkwTL8IhOC0H7HeEj9ftfvXw22FnZqpVqksS4PkJI+hUZ1RnS?=
 =?us-ascii?Q?nOTNISNWlf3/PUG12BhuWYLriZhEroXOxIsmfVmfK7LwwUOag4Va8xyxzkW0?=
 =?us-ascii?Q?m2ePSwOJ4QnfFe7HF5NMQc8e4GX5w51iol6Gav2z0KpMrc4pckWnL1wXM3o0?=
 =?us-ascii?Q?qoyi0A4ZzohfVljd8XftFOrLk11N8jp0UqSL24cWA/TKBqacoYC+kfhFMpgI?=
 =?us-ascii?Q?eU/Eyat8EEnczzboOSimjguX/5oLG9h85jGMQV1T3Q2RXG272imCB/0UcPb9?=
 =?us-ascii?Q?MtpOiAI/Fzl+K7e53ZUQOUXp1RYmcko69gl6QeeB0DfwsbFNHgPJKBbvNRyT?=
 =?us-ascii?Q?aHttd0W4OKdwAJPwk2pUzLBvvezERHbF4bYS6dztZoRo7xHNgoJjGn2S+ma3?=
 =?us-ascii?Q?m3dDGJ0qwfjr7qpYQCMCvlo0BFZ0zDxPQhK/EqFIn916KbHghZ8XNsPiZgBo?=
 =?us-ascii?Q?j2J9FfsZxV+omkd8qkavu4DUn5lm/wefz9K3WvdT/nZCCL4ze/wnNRBftPVL?=
 =?us-ascii?Q?Ab36v4yI7CZd3vgxLZ0d9ScESvUD5EHX78lQOEM6cRORQY/W1i11VxGeFAzN?=
 =?us-ascii?Q?o+3zIhCooZCPFb8vZotdtRbMhIKsDtkVDWOaQIhPHGGupxTagR3tVOeAv7VX?=
 =?us-ascii?Q?JJeM6Q2ZnZw/DpJ2FDIfoT2ZluReRENDUZ8KzPYzfPxTEWRBkywUae3VUzSH?=
 =?us-ascii?Q?evCEzuYniEWQvu2oQgxdpadLjnFN9lTg3sIRHZPIKVu9A+P+BOL6SG0/NvIb?=
 =?us-ascii?Q?zknweFLTTzo47KuWX23Jq1ecquid8FoITQdUCasaX8Vl//BQGmwtdT6p2uiz?=
 =?us-ascii?Q?XhHFpZVq/6IB4oJZq8gc8vUyCkLRgYTBJ8LIRoZLakKIX+2+HOxIZN6XVapA?=
 =?us-ascii?Q?4M+jCZAW67sLiZAwF892m2HMW2dY5CnXiFQPJ5TMCMSgZWLKNgYuRAmW0z7A?=
 =?us-ascii?Q?CAfRTcKjj0hIIOpg60BANYBZZRwAU9pCBrbIl82o5E5+NS5MB3749wAckJqF?=
 =?us-ascii?Q?MkqKL5IqRZeLVLUTQIcQ5IEOs6j4HmXeStTVDFjEbA1Kt4Aag3j82ZznZatx?=
 =?us-ascii?Q?TFamVc6Xq6tJFImBxJJQRYfnxWVOkcFiQsmFw6L55xlni29qvM7uBTvk+Tvo?=
 =?us-ascii?Q?EdP2fhm6wkvUMHW0rCFsQlz8MlTfEhPyS0EQ7DyD3H9pl2vZ7PhuF1tHTILe?=
 =?us-ascii?Q?s/kYMJ59eNIRqg8G3b9yU0kjmFe1zIPgM2Ya4XgDKR8FZ/ezb4YPxpDi7yVY?=
 =?us-ascii?Q?OwKpXojfIvnOlVUW1wyqjxpsEZYAbYTqn6E9xzKjMYKBh3HW+tdpEApzen8q?=
 =?us-ascii?Q?VmPLD0yhBcglpsW+NCtfweRoCdR8flEN7h6ZevibqSG6dPc0EHC5xULv85Tm?=
 =?us-ascii?Q?zfx6LelXVN1KUDA7YNGlR+OXpApjHZTSMsiZsoswqo6F5H3XcrN38nFmM300?=
 =?us-ascii?Q?YLWqa+WH3noTIRsg4spB6eK4T89JR9Wj93K1JpVyqgrLeVRETuVEvoaIO/cs?=
 =?us-ascii?Q?mXXXrNF3LaVX1woV/0VEYDGqXF8FSLJ1YcsG10lm+WmRElu6xmCNFilaUl0R?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	svk8lcmMPD7ToOdr5SWxmBhtzpzA9JR1i/dSmptBduOd4i7+C3ZgrSVC/QpKU7PpO9TR4YyGBAnN4BIijm+cHVdXatYF2kFjpcjiJDKgaN0rrIN0vzKgFZmPdZOyUKozsHOSKAWMRgIu+BFTOBdnaua9KkV5X4W3m2cBfqxDyL+oNVva3wpMWxgZt7OODxqvmZv+rsQ82MscGLvonR5rOPkx0AI5DNYsDiN8YUZh4RKMHjryzemWO4B36Iw8WrLNv9DtrLY1DxUlx9lbECQjozRjmWxhCQey7ybBlNj5183iMWgSFAlfqaKKCsYOF2ue0D6g9tE4yfnlIo7g2h1ushDE5iK0HvzqeU8Hty+XX1MTUlErED+BaijdPHaSpZC4U9RKcCvg/RD1QM4ycClHTOuD8h4Bdh+cJGQeyHM3FPXVjqmVzjnZoBAS90cucsAfNogYwGk4ilTCd+Dv/+7E8UkPL5MzjKYBIBw32yorXZ16kc5r5NR3lZ/QpMrWNk4AJGBRDSKNYoqX1HuBBcOj0BdkokR8mvXaI6GZ0fHf6IvvliOfG4OYuBXAJ/fa8cLzn2Dn3aRdfCAjqIaA2ldHNtdd51jh8+PdecAAmYF+z0w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd80b67-fe2f-437f-a7d1-08ddaa877ca0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:35:04.5945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yqjriur4KkWt5gnlT1CSorHHCK1/AUQHm67Jyo4d6mcJ1sHPYge+xwKI2qbi7Rodvn6v+4wYoaIyyVfTsSUAeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4430
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506130106
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=684c371c cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=AGX5adsQCACYOr8YtfgA:9
X-Proofpoint-GUID: b8aS4YH1P96ledAt6G37sFrrkgJHKtNl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX9DCiW3DtaHIe Ev7slkXXbFh34mXb7c17xxwkur5gap8mRh6POfpu1EiHNNEwndr9rAg5GkK5g9WExTH9NYk+Wbm g5hKN2dy290f62oJgFcpHbYf2FXy2irUX/qU5+KCMuatblkyA/M1gU13Cz+BOuzV+F7oIGz0vTy
 xOA3bfSK9bJVUa+snfTDNlwlF3l45U0lHIh7/MEAjnt1KtdVOSX4vU/JsXItQuLhiA8RAznDG71 41hcZ/ymfYKoCsM80GXdZzpyxT1HbkP3l//f5Oyq8iF5nvgqsHMmr3X7gvvVXYESZxwjTvaMHnc 1FFQBIIbacvUUYQ/pfsKNA2/ueN1mlV0566lcrPo8E/9mbEQqAIyTDEbaDCSlCAikzDeAUgyoyi
 acq0alrpLerOve0KutEZeT60Y94xvkubOAhG4eWmPMXpvRNCUaf1lN9rzsS4XIkXrkUH2fTr
X-Proofpoint-ORIG-GUID: b8aS4YH1P96ledAt6G37sFrrkgJHKtNl

On 22 May 2025, eugene loh outgrape:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(looking back, 4 is the right figure. If it's wrong, the tests will tell
us, anyway -- presumably we hope that the underlying bug is fixed before
it changes in the future and requires us to make this a
per-kernel-release value...)

-- 
NULL && (void)
