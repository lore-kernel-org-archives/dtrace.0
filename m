Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C481C9EDC
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769924; cv=fail; b=gaXyFSybZdygWH4gdi3lF89w4SV6sbvRvYZkIsrDg21MVyDfAIciMkoyXd7EYrPvNi5a00FhSahvmd51JsbhPK1s+DGVsld2giFqbYzEqwmksqlFgZFakN1GrRR403ZLqjJHFSHTJRgnq6E+J+30i7ELcaweGofp4SrMRBPWRvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769924; c=relaxed/simple;
	bh=/DYq5yMdKYN+hmmmeije1G3HZF8tuY3vCR5FO1wCpr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dLaHME22OOo7dbsvTpiN3QBPYoZnafeAaoUC7O/D1EJxlqbNNnKgBuFMmZPfH+x9cGQEoWPAA0f1MR0utv7SyQ2GseqpH38+sExa/HOspi6T+PnrFiW/qH3iDU77fonZbEXINxAitSBEC5iqR6VRy+un8HSgdY+5mxJWnNhA+Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RkG+2zxs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uN+5JYdZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RkG+2zxs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uN+5JYdZ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2fddJ011995;
	Thu, 24 Oct 2024 11:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=RFkWLXzJQRZ2pros8nKzMe3bw8G27MRQMnFj4dI6G0c=; b=
	RkG+2zxs6r4zvKrLQqqXGiHcSB++obWcW2DmvUzZ/YTZS209hexh8N1+5wcJO5sC
	ZT21TA9V0bEIdouaY6+1HnuynFB3Bb3g5nS9QIdxvV7qEehlHebk2YRl2yNstB57
	PTqIcOgcHmaOrP77xIBrYgtllofYSm+VRryFR2Y0XpdgNG5oY5zK1L6AfO4nxfYV
	PvPA7j389DyfU2PlkRgaFD8i70SeCuHEZkiALTgIG8oyqjorr2qN21PtorXzhh8h
	gNwjMAWAHx6FhpPAYgvRyhfSJ3O6TzLNznB4sxsmrCeqgJtrBF+qWbOfGqVy2xAi
	9XC5RlIeVhXqm0I9VBaoag==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53utbap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAL8bk036212;
	Thu, 24 Oct 2024 11:38:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh3tgru-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqyV+7FwMBEDvjPOuKYtSQLOpvQnfCTYHEoT4V8h4mX4YJ8uaDyckp1V+aJVPKopsJEXfbB0LZ0uaxjACUkK5AyGP+LbsTkAnQU0zQieJUwYdmKCQRZXgzUE93NULCUXdq2VXunHc8CQRJWqTppGqiEcCV0H15sBRfE+RNCuphj6CtHu8BqZJ0fql0GPM8RTGxiY4qZNvxwirBJQ9wAOHs5PYyiRVDwyLRMn/UFVxJmyNkxO+x71muKF2KX5Q4DTsWlEBldiK5HpvMBZckiU1ocgmwPpPYNlHyrToI2jUYqyXjp77nRr0ZFpGvsYC1+/bCEo0W6JJn4PoGytr0qnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFkWLXzJQRZ2pros8nKzMe3bw8G27MRQMnFj4dI6G0c=;
 b=XWUF6kgEIjU+zIL/okMLub1i5OjXnfMceXW2FYDtjPLeTg3MQ1z02zlkJBDbBaIhtcUVpW+E1lfIbpyVv3PaGH61aaiVw1l/rTmsWpq6lQ5mMsso/JNEEb0KaN4MFhiQede3p1MaMo04c9ALYHLWcKeQQ/TwIZW7KEgKO4t58dUuBFLVf9o56daF5wV3vTqC83cX+3lRtApqTasgyhSSY7ZnN+SF1dfNrEEsQl6NZJuTmvj8XGrozN8sXt0sBJow1vfPgPizPusH9o4BFCEeAuM9KrVDmzauPXbXc8Mk9IjdqR2GAuBvihNeSGDH0t095zGWR00M7kXGUXROnl7P3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFkWLXzJQRZ2pros8nKzMe3bw8G27MRQMnFj4dI6G0c=;
 b=uN+5JYdZw2vTAi4jWbvXJpQB8zND/LW3AC/tGnM+Ch1gcL8hiuCTHRNZpDTFkQUMY3Ptputjd9DuBxl8Y4xFX46nmdEUmP4PBma3+ixg7P4U4WlGWkTT3R0J9viHMvasEJJbLR0U96PHbHmrKcufLl00FjnOPoD32b5wl9gOUIc=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:17 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:17 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 08/14] man: use \- for option dashes, not -
Date: Thu, 24 Oct 2024 12:37:52 +0100
Message-ID: <20241024113758.182050-9-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::18) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: f897eda5-67e7-46ce-beac-08dcf4205aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kRwEbtCRPTc0bGxqRVjIMhXZQVB6WNe6LOJFTHFEiqrVwcXZo14iMjdJajGx?=
 =?us-ascii?Q?CCyzir2GjWpSn9Xn0CbNDvwz7xXGRaTlzlIudXNG7huNNvOKOTY6EF7+flL4?=
 =?us-ascii?Q?gn+VhAFTaU4JHE1k7iF0GpvsfPvAg/No5h+mswCiVWmJzXrf9sHFkh3PLrub?=
 =?us-ascii?Q?/elKI2wT1FdlGC8GKHxrAM77nZt37x/E+44FRxvW6yaGHYINDHL+kSYTUpdw?=
 =?us-ascii?Q?otNHBjze/zH/JHwQZQ6oaaitJ2AISfdI3KN9Im38kFo7XwLOF9IRsrH1ZKxe?=
 =?us-ascii?Q?jeeg4bSf1fpQqi+m08XCO6z6CWe3YYn4B1q6FRMApRqF/Sor6RZSEuPtL90K?=
 =?us-ascii?Q?/aT1GOmxby5mXX1TbLaQXugnDzlD2IWykwCix9vqJpEPpG9ryBWpzYoZGs84?=
 =?us-ascii?Q?dA2O/kpJ6nN6ovPsAKcK7Bj7Jirf0riuCQJwhIHWJwrZXH4Ndd9zMKmEKPoS?=
 =?us-ascii?Q?tIUSWInrUiG1LV8gPEtoDjkBocgKSC3FCm6XjxO6cKMNE63RnybaqT2cilaY?=
 =?us-ascii?Q?eS3XrvCygms3uDyyxlBWUUEh1udzaKd0XHZoKd35ql3s2RIC2+j6rLTHpK0M?=
 =?us-ascii?Q?d2OWmg7b84jjWTsP+vf+iMOhv+mjcTTIhAyciQGq2J9H6sEG+um8al6cZtfu?=
 =?us-ascii?Q?UkCnHL0DemAFiuV8drn7zK0zgYbRxfLmzpToO/bNPxsoqqraJ2iepDjDOlhx?=
 =?us-ascii?Q?rkLNNXdHMc/Mu+GM3vlE/+OPZwXZdDNU578eWatLfzkOYjqTjpzv610OCWhq?=
 =?us-ascii?Q?nFoGt1SKVUhb4VUAaStAae25m68IK9NcEpotB1LV2HKorxkuOGB+r1emKr8u?=
 =?us-ascii?Q?t/8WkO4z+++IN7G2Vep1tpq+rt78nS2iL73sBBZ8blrl3mHa0H0TF/I1VxcM?=
 =?us-ascii?Q?C76gyCQUCXhdyRzfkA4NUwGAT7fG5OUD7qpiDh8YGqBz/XEOBC4OJu49TGmQ?=
 =?us-ascii?Q?atEbQkg20efJpNb9JTGBQBYEQVfb2siWpyEsFxCLrf+q0jZPKLST6rYZD8rP?=
 =?us-ascii?Q?y4XHd2gWXMJqZWBY3KXqXoZ6cc5hwftTyRHMSapGO7FZXGxkqvVo7aRE6QVp?=
 =?us-ascii?Q?fo0COCgR0uQGTISZolmSmvBA+zUD8mwB5vU/YSG46lkwYbvNT5Hq9Dqs9mS0?=
 =?us-ascii?Q?TStv0fsSw9gtetj0o/VKpeM/0L+HHp5+FJk1u0XuKRnyNHYcKIczBV77CBwx?=
 =?us-ascii?Q?Ba3hwSZH4dxi69O1GHhnR/R9pp8q4GRhby1MtzBiIRqCYW170WpORF/G+cgh?=
 =?us-ascii?Q?VR99iozsEs1Y9No7UwnXjXICSiXhBP6/1pGt1uqJCMyezsBv3XUlXcW4VLJz?=
 =?us-ascii?Q?wJoNCcyWcMkA0x1O65CoONSs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2/GLSIsIftewESAwwV4gXFM3q+GXYeXuenY1POuJLYXB0NieNIZmSj7GBH+I?=
 =?us-ascii?Q?vP9CNeZIavuU2SLW1AZ8IlcGRKWQBafTRS+hnIIPwAoM3dElE5WDz1w0g8Yb?=
 =?us-ascii?Q?Py59xepvFSRRtXulREQ2m/RCabcoa0KBNX4lh952efd+YwJvH2n4JGD/qQrJ?=
 =?us-ascii?Q?juW/E/QM86L0mdAyTgt79uqPaoC0GkNQga+ACEYiIylMdLMDRB000prCcwQr?=
 =?us-ascii?Q?Q8xML42yPi4FnysJgKsIPUYkewUW7ZLN1ZN51B+M3rDhxtdkqJkDvphFsZLr?=
 =?us-ascii?Q?kLKNFGwUoedtifEr/SS8UPum++y7vtw6zD9mgibb+66AL77D1n5jE5nz31yx?=
 =?us-ascii?Q?hxWFEk+H0JBXiKehkZbQ+FA2hyF4593b0kUtnV3Xaj0Ja6WqVMf0cm6+c2yf?=
 =?us-ascii?Q?aOiMlH1bKmLLeARQCFoUFR+A9mp1JxTMmHAF8AZIJPza184P/qftCZgwHa0H?=
 =?us-ascii?Q?Zt8r7VJStU4iYi20NI4wTpk9SijFivusd9c7EeS9j6UX8N3fwfPlA+npkol1?=
 =?us-ascii?Q?AiXFE7jPU6pMIwChAKMKonvYj5/nk/ouzdWNZx6Nwf085EoH59ViyRjvTz+G?=
 =?us-ascii?Q?mcasOPEHC/i2XJV3cC891eUMaZ1MySAU8SN2jousDoe79O4iaNApe0VPRMc3?=
 =?us-ascii?Q?e5/GKTTV5Q1hqxOJLGo05ZCbKYPTP3jedalMNWYtP5vcvg2BVs/5ptQmTVi4?=
 =?us-ascii?Q?HisTj6fGLYQeMzRxBhXT0pBzypM7UuNzdcf3fWu658c5jrK+mC4ZVAno/gjT?=
 =?us-ascii?Q?YvN6IUOP2jezUbPVQcTM+dCoL+FCzv/+1BfgCfDXleaZqR71H1dEFMeO1ekL?=
 =?us-ascii?Q?eZC19rjmDzhdCE5y+8cvBRRF7uP5jf6wrvIcxHGurdVvmgUhTjb/Nak8woa0?=
 =?us-ascii?Q?3dOhwESwPUmI72zTjlAgBbBYhJfr2j3fR9eVSxky+7xTSKpjCF4Fpwa7VZi+?=
 =?us-ascii?Q?XpxejzS48F6okLEUHa1W3bejTJFrt2Hw64oHu81gTgOXhYz/HMZs6LvYXVXN?=
 =?us-ascii?Q?inPNCAIPDjBEp7gutuOlSy7ijF0EeKpmQkmDVUqWN1PO8R2g8+8Ms+/g9w15?=
 =?us-ascii?Q?tgVOjgkfVDESBEBH//WrATPlmw29Jr7wNFAkVG/yhWRwe2NVLrKsIkv3HvIV?=
 =?us-ascii?Q?lewKQjxP7I7xQwNnHjVhtz5vCRHqAtTLwpYp1QmtGJ36DhCPQ1Hzk6e0VEpB?=
 =?us-ascii?Q?llZjBp6ns82desGAApyylT1nuAtzleXbvAr7jYB+iwsvuAitSZ6dg+8OAz1I?=
 =?us-ascii?Q?7VWSJGwlb0hk9LGpAajyN5ZcKdHCBVdtWV4W//+ogEHzLMaieU+ygNmFNo8S?=
 =?us-ascii?Q?i8HPjtzHqldauC2TK46o1Ee0JECWYJqpZRur8A5loIhOp06qtLX54ZVQAIWv?=
 =?us-ascii?Q?3SEgTyhBrLBi7I7/O4u4ELRWaco0LwI6W/jGfFwHO/TdhM5sQd0G7dWCBAY2?=
 =?us-ascii?Q?ow7VBB2EYKL6P25x1EgfwKtk7uNhh45+UXOfGBZaU2HfTb/+K2/hDvUkoFsA?=
 =?us-ascii?Q?cpiw2jCK3/ZU5+M9oRe4MXRwpdvQ/lmXAux1jjYd7iWH/y/vhM+YbPWWmYVs?=
 =?us-ascii?Q?E73+y82GggE5gLY1LC4w2phi4Fo3hdq3C9M4CVkZLvUE2X5cT37qDVj9ovmv?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YPjcZEhfmrT8yVdkfMQJGGzb9EMRKmSkrvr6e3+Z1UEXx//vO8yb9xsTWjQGaxqo8LDcUMH0M5sZIb6r1Mjg2ulJBytFZqKTW1IdhZy4EXBkHg78Oq2RDutBC0Q+Lcc1fL2qyJNMVl3m/pm6rGCAIwK2RPJ+gVFl2cMlc/TbognOh3HEeQ3rSDk6+fn0HQD9aI4iM2Yjleh0Xe0qUsrkKqEUTQxVnPU2UCHbhLFyWvqQzxv98xsscQ83JGRt7S/WdaSZueCusA4W77Odg5VurPNVkc9OTq/JQNtJCEVh21nxNHvFZ1Ajn1FA74JZFwCCT1VuFQaFxoL8Atcm/DMHzmq5ADaanOu8NjezHQm/RBPFc2F99o/4AYswrDRDRkjZ7LPusrvl5WoV/id+hVVUDrhThu1XP5D01YvuJbW5FGEVFnv383Dln5QwPWj0Lr0uQEzAHw+DNkiBgLJgU98RqFze+pEnls6oxZnHn6klyJcIANWgtlkvKgP3OS7LNXFMphA5gHe31sWPWHLtHIT6C1VKGU5uKoc3gkGjCgx2U4bQw/MgJsdr4q4Y/igf0ET3phC3/MJJlRUm290g+ni3mBXVvibvaDKDH45l9YthpIE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f897eda5-67e7-46ce-beac-08dcf4205aa0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:17.7940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tpy7j0cT1OV5mbYruQaKLiOZGf7MofDyOc8+LVq0s9LemkgCt2PWgpmZi7f4e2fajTQjGqi9Cx3PDR4IX8Kbpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: J30svQs_xfMQzZZ05HOgbIv-ogdIQpbV
X-Proofpoint-ORIG-GUID: J30svQs_xfMQzZZ05HOgbIv-ogdIQpbV

- is a line-breaking hyphen, almost always wrong for options.  (Its use
prevents the option from working when pasted into some terminal
emulators.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 cmd/dtrace.8 | 116 +++++++++++++++++++++++++--------------------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 940ddfc65d1a..a53632949e72 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -57,119 +57,119 @@ Options that generate program stability reports
 Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
 .RE
 .LP
-You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
+You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
 .SH OPTIONS
 .LP
-The arguments accepted by the \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, and \fB-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell. 
+The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \fB\-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
 .LP
 The following options are supported:
 .TP
-\fB\fB-b\fR \fIbufsz\fR\fR
+\fB\fB\-b\fR \fIbufsz\fR\fR
 Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
 .TP
-\fB\fB-c\fR \fIcmd\fR\fR
-Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+\fB\fB\-c\fR \fIcmd\fR\fR
+Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB-C\fR\fR
-Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB-D\fR, \fB-U\fR, \fB-I\fR, and \fB-H\fR options. You can select the degree of C standard conformance if you use the \fB-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB-X\fR.
+\fB\fB\-C\fR\fR
+Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
 .TP
-\fB\fB-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
-Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB-D\fR option to each \fBcpp\fR invocation.
+\fB\fB\-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
+Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB-e\fR\fR
+\fB\fB\-e\fR\fR
 Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
 .TP
-\fB\fB-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
-Specify function name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-f\fR option on the command line at a time.
+\fB\fB\-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
+Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
 .TP
-\fB\fB-F\fR\fR
+\fB\fB\-F\fR\fR
 Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
 .TP
-\fB\fB-G\fR\fR
-Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
+\fB\fB\-G\fR\fR
+Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
 .TP
-\fB\fB-H\fR\fR
-Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
+\fB\fB\-H\fR\fR
+Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
 .TP
-\fB\fB-h\fR\fR
-Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB-G\fR option. If the \fB-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
+\fB\fB\-h\fR\fR
+Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
 .TP
-\fB\fB-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
-Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB-l\fR. The \fB-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-i\fR option at a time.
+\fB\fB\-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
+Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
 .TP
-\fB\fB-I\fR \fIpath\fR\fR
-Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
+\fB\fB\-I\fR \fIpath\fR\fR
+Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
 .TP
-\fB\fB-L\fR \fIpath\fR\fR
+\fB\fB\-L\fR \fIpath\fR\fR
 Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
 .TP
-\fB\fB-l\fR\fR
-List probes instead of enabling them. If the \fB-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, \fB-i\fR, and \fB-s\fR options. If none of these options are specified, this option lists all probes.
+\fB\fB\-l\fR\fR
+List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
 .TP
-\fB\fB-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
-Specify module name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB-m\fR argument can be suffixed with an optional D probe clause. More than one \fB-m\fR option can be specified on the command line at a time.
+\fB\fB\-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
+Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
 .TP
-\fB\fB-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
-Specify probe name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB-n\fR argument can be suffixed with an optional D probe clause. More than one \fB-n\fR option can be specified on the command line at a time.
+\fB\fB\-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
+Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
 .TP
-\fB\fB-o\fR \fIoutput\fR\fR
-Specify the \fIoutput\fR file for the \fB-G\fR, \fB-h\fR, and \fB-l\fR options, or for the traced data itself. If the \fB-G\fR option is present and the \fB-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
+\fB\fB\-o\fR \fIoutput\fR\fR
+Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
 .TP
-\fB\fB-p\fR \fIpid\fR\fR
-Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+\fB\fB\-p\fR \fIpid\fR\fR
+Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
-Specify provider name to trace or list (\fB-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-P\fR option on the command line at a time.
+\fB\fB\-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
+Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
 .TP
-\fB\fB-q\fR\fR
+\fB\fB\-q\fR\fR
 Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
 .TP
-\fB\fB-s\fR\fR
-Compile the specified D program source file. If the \fB-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB-e\fR, \fB-l\fR, or \fB-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
+\fB\fB\-s\fR\fR
+Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
 .TP
-\fB\fB-S\fR\fR
+\fB\fB\-S\fR\fR
 Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
 .TP
-\fB\fB-U\fR \fIname\fR\fR
+\fB\fB\-U\fR \fIname\fR\fR
 Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB-v\fR\fR
-Set verbose mode. If the \fB-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
+\fB\fB\-v\fR\fR
+Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
 .TP
-\fB\fB-V\fR\fR
-Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
+\fB\fB\-V\fR\fR
+Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
 .TP
-\fB\fB-w\fR\fR
-Permit destructive actions in D programs specified using the \fB-s\fR, \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, or \fB-i\fR options. If the \fB-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
+\fB\fB\-w\fR\fR
+Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
-\fB\fB-x\fR \fIarg\fR [\fI=val\fR]\fR
+\fB\fB\-x\fR \fIarg\fR [\fI=val\fR]\fR
 Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
 .TP
-\fB\fB-Z\fR\fR
-Permit probe descriptions that match zero probes. If the \fB-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB-s\fR option) or on the command line (\fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, or \fB-i\fR options) contain descriptions that do not match any known probes.
-
+\fB\fB\-Z\fR\fR
+Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
+.
 .SH OPERANDS
 .LP
-You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
-
+You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
+.
 .SH EXIT STATUS
 .LP
 The following exit values are returned:
 .TP
 .B 0
 Successful completion. 
-
+.IP
 For D program requests, an exit status of \fB0\fR indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fR returns \fB0\fR even if the specified tracing requests encountered errors or drops.
 .TP
 .B 1
 An error occurred.
-
+.IP
 For D program requests, an exit status of \fB1\fR indicates that program compilation failed or that the specified request could not be satisfied.
 .TP
 .B 2
 Invalid command line options or arguments were specified.
 .\" .RE
-
+.
 .SH "ENVIRONMENT VARIABLES"
 .LP
 The following environment variables are consulted:
@@ -180,7 +180,7 @@ Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
 
-Options set this way are overridden both by options specified via \fB-x\fR on the command line, and by \fBsetopt\fR statements.
+Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
 
 .SH SEE ALSO
 .BR cpp (1),
@@ -190,4 +190,4 @@ Options set this way are overridden both by options specified via \fB-x\fR on th
 
 .SH USAGE
 .LP
-When using the \fB-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if , for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
+When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

