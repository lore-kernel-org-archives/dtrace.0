Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636373D81
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840396; cv=fail; b=AOmWjZ7qX2Of0sHBSv9DOQYa9Xhl300t6YhlzZ/VNnwsafD23q5oH+K6kmNoHGMO6DPcCFHHFW3iPV5PUSFx/GrBHR2gS6KRXpEPbkice54JQC2NNcox9oq0+PSK/RcvbMV4DBfDwjek868ild4RGjMd9YmfATT7umJ0z2U7wjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840396; c=relaxed/simple;
	bh=csFC0P78RjRcHijGRk11zBupIr2JUyFANLf2n0bkSes=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D1aII4cMz10tyWxlHJ81wdK5N9BIBgqswxxrBCRL7ClCrb7BmhkPDabqLSiiPZkwpvX7xwPWX6s2QLdpJW7guM9zDqKE1vQWyHZIexz7u4FD+mSPevjFuXdSoZHLjZkHZxeG+w9TmI5qTPUsBXAczRUbU49wQaQv8fC2YayFKyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z6EPzmAw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ItOabWEi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z6EPzmAw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ItOabWEi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KfXX4000978
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 20:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=Oo9BG9XPObbQS3Yn
	oBGrmn6tqJeDSkDuoIjjP7FgOqM=; b=Z6EPzmAwXnZQBqEsWIy9B4Cll/kJiSkN
	nJOlTKvlgzLVXH/rDn2UoGyMtpWdHQWpyJ3vOsL81SQd8lDSSRKuWjWRHq2l36xH
	sCIpnAWTW8TDv91BhVrRpFaROTwVp8/wq4NiggXFdo2mGNYTzHhpAOh2wzxi55S/
	HfMJzS7yzRDG3JXLZumlSXipnnORzCZVgUNvjTYIVm8Sq8EApgkOpnzrCa79rX3F
	h5T7u5VnBn5nLmuB6hFFSX5MFSW4JJa/k4w3YWqJIx2PkjpLhIr1wZIaL64Ep9ru
	yCO4llu5t97GcuPStc9jCCKjWqXT/gG1PEzgctKQe4jv4GQwgA1Zhw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nagc6e42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 20:59:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5Jlfo4005116
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 20:59:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p87b33u8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 20:59:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGhgdg2mBoitpyNRKpwDEz6QfV/ZChf25LzJ+kzqqAqYaxdWat+WGnTpccSHXu2tcd8tF0blIhVSSiWXU/qHvnBgzHXd9S7nL2x1uUf0fwJibZqz6koCN2bhrogojG5aSLyNELZQzMc3u3xnbikLr5X3chDiWHfB98gqOkR2ju8c79sFRNwRPaR5jVPxE9Km/+u3nJxS9KLdv/h2f3LsRrE3rs9hjU6i/+dxOBp5G6naq1yZOCfJ26NVXItbFccP40Br9IMwIBCxm47YqfRjYUXEvloCvnPzEOhUTvDyQwmDYVx1HNgvjxfo5AfO2dqAHAAFbQWTBEPloSTfzCjYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oo9BG9XPObbQS3YnoBGrmn6tqJeDSkDuoIjjP7FgOqM=;
 b=AfvwQ0othZZx+SPsIy2vmjtYuGBU3xsEw/URwI7V18j5SYGtWY0mtoDzRzN85mnxByVtpJwAInEf7WpoU3MgB8dXPdtDOK1F16fkc0L9irWPEU84fdxAdGLde7hD0UU5ObUC+UBjdp9gzuxq84eyCPy4Q3KsottnqM3T/9N3zblRgypfLtVFphsvhAv2Pb6alGPWogfH0p1aTZPSdR74gYFuJpGDtmxLs8y1pnq6ax5OS/LCEBGFm8bkfqSfnxso8uFCjjnVs6x2H+yyuMUxkmfkTkKBNNvd/qmXQSekEPqqgBya/mNTgSN0olN/rE5ZTviNRnhn/Y3z/uv3Kg/AHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo9BG9XPObbQS3YnoBGrmn6tqJeDSkDuoIjjP7FgOqM=;
 b=ItOabWEimTWEIasV6njgVMeeCkJKLk0bcKtwAp4H3lxzy7zRlLckIlq5OyENTMr/83eV0JYE1EhrLRBBW/7prB5mXp6SJaqaFmJJiO2IKjGfRhAIQS45GiIVPGdqXbhCo4hZYwhe2HwtlIhbfSzZrE3UQB8bsQW5zFY0tB1MmOk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SN7PR10MB7075.namprd10.prod.outlook.com (2603:10b6:806:34f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Tue, 5 Nov
 2024 20:59:48 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 20:59:47 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v6 0/6] usdt typed args, translators and arg mapping
Date: Tue,  5 Nov 2024 20:59:36 +0000
Message-ID: <20241105205942.192409-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SN7PR10MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd741d3-124e-4b1d-c7f3-08dcfddcc824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SOH2qAzqXnZhbvhXyRtAu8CPygvKbjtZ5Lb4uVGDH/DXVcjAgmsTnSaDP9dl?=
 =?us-ascii?Q?BMWUyIzrbTYfO4w2rNcOkgO1eY4EQ9YdH/KsrofYLdrmomhaOsHOh26qC8Lg?=
 =?us-ascii?Q?UvJJIC2MvK1j154siHOuHHGG2rwrD6CXY8Jzh/KkN6T+8QDMnAZx4ZEt6EZv?=
 =?us-ascii?Q?17fpb+eJZLOcpAxlrpTocwAGoIEZ6M9iryOUXSJLdYm1wSl+54UQ6bTc7Hxy?=
 =?us-ascii?Q?AsfF31clBPhC6wRK2OCklAg2/xURHJX3f1R8b8x5nwSM+HKcMXc/WNl7iwLS?=
 =?us-ascii?Q?hdQu0RHHpV0Bs6X6aQZpozotX4DVBMCMiMQ1pCSjTSPSbl5i7gBNhrt0kj35?=
 =?us-ascii?Q?UxWIqZsH3xZEQeXB6d8dopgdLweRAxmWkILC9LLv8aRZjH9PSAzZYjtmyRo/?=
 =?us-ascii?Q?JbCXvINhmcBgnb15La/qyxnWffYr/f68YiY/AQfSRhpYmbbfvoykG1B7Vnp4?=
 =?us-ascii?Q?IfTiRTwBEvLsvqiCpJVlxTdH3ZHDKECt58ozUUZxNwfjWZ9vbhoT1MldvXSS?=
 =?us-ascii?Q?BX8dL+E+sNHKZ0qlZ84X+GNjXOk4Yh0kBOUPbkxffzItChOzk9Qe+kOHuBtJ?=
 =?us-ascii?Q?r1A2vbxVJlMPPM1XBN9K6e4n+CffcTyT5l/GFGvghoGa1DctOUPkQlXI2Wf6?=
 =?us-ascii?Q?nBsWJJRsUWEjyc/GLG8TxxMEhPwvpW57w2nO0nJh63+0hxR+FVV7yqbM3Xc+?=
 =?us-ascii?Q?1GmhCsNxU3etJBZosv7oOshy2+ohhzIksgJ7oEaX8gz9Laq+JFGf+hacWAoQ?=
 =?us-ascii?Q?UynwYyvRTB2VikhpNmRw0t61zMktBpYX0oQGmXmk5HsW6975JbHRX4YCZFFZ?=
 =?us-ascii?Q?yqxe1BrvWsU2aE0J7capC3TMoIeS82SfIdxs8sy/R3hQPdb6j5AVrUiIWLSY?=
 =?us-ascii?Q?+5uKYT3q3RKYsUOcUDgxmfabd5gycA4AF6iY2BwFsTW0CRUUOS5UJBdm+5Ua?=
 =?us-ascii?Q?ItDdm8msOEnAlzJYdFmi61Lsl+X8eKua8GdrvVDS6zke9NeR3bVIuJmhHpFW?=
 =?us-ascii?Q?eGZadwAjaRMj4wZ6MWphdXyrtM8+TjLKJIULHFndJe7Yo+PP/gkwfocUvLau?=
 =?us-ascii?Q?iSmYfMracHgoDbefdON5X5UkfxV9s7ConnvoWf2nw/vebH1rhJ3U4nPUQHVv?=
 =?us-ascii?Q?xpTcd+5WwDPSlYLaTjoyDnJaLvF1ejo5lUgK/SXbdtlSz1E/xnEuChU9sxr7?=
 =?us-ascii?Q?EbiWNVeWwaqcmwgt3M/F1VT4DsOTiauxyKHDjkrwTPleXWEhBWeoYQNUoM68?=
 =?us-ascii?Q?azsjrjlMXLPBhvG89m2gr84pX/Jrn/2xjSLbIcdzeRHSvewKVM4Z4bXS9cSY?=
 =?us-ascii?Q?N141OZ9aXO29I2a221dpJj80?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3ENXFK+72sXPWy8kwvvVwFf/OBMcURp/6mF8tOH79X05DuKBBzvr3DRxNj4O?=
 =?us-ascii?Q?Jm8FO4w6+m7BegVXTw6LshljDpPG97fEfQqo3HQjUtCbFQs0VWOrE+otab8C?=
 =?us-ascii?Q?P5imANXtj4+jkNSlkb9HsVpp5CXK/GqYvwx0CiQ+sf/oSpzHn8WJLFLxKNAa?=
 =?us-ascii?Q?qJ4bYuH0EiyJolkOqOozpBjDWJ9GyyTB6vPuaxztZUtR+uMKH+akgwbZ6do3?=
 =?us-ascii?Q?+dZnIV8bgySwKUmZRN9dSjxKScLIwvmEQlnxpm+yHTYSjO87hTl6UvXlDq9z?=
 =?us-ascii?Q?y+6cE+/1AFj4IlXNe5cKV+hOAs5NIog3oHoiS+xxvoyjc1t923pMlCArPAht?=
 =?us-ascii?Q?o3Hnkg3GK01Y6dp7aqMnfU/NzmZ1d99wB1drqz33QVQHpa+IFgSZTZDM/QB/?=
 =?us-ascii?Q?BrFDS79rmMtBIYfTvRLT8wR+z0pTDc0ARjH5WjSNfEgbcpAlRRcflwYaTJ16?=
 =?us-ascii?Q?Rw7HG+C4sOUUeMTqXXYSBq+BmmOJW2geOvwPxl5K7NmAF/e6+D09MUB8Bctl?=
 =?us-ascii?Q?o4+GA9RFo45faMvUMR/s1LNH4+18umYQ+LYFNllit8W+qDKj0FAhzrBE0pnr?=
 =?us-ascii?Q?Zn7+gxw4cyDoz8G8/ydOsdLyOBpCZBIHdFJ+yuirzr4ucabEpYWBzB5PYhhU?=
 =?us-ascii?Q?tJoB9PCQv0fYOng/QnKjwuWcB6A4xAA9xftZOKNTOjghYvdXWogJsM/Wja3b?=
 =?us-ascii?Q?0G57FrMmXjNiBTzA+OzFj5qFzoC5bePEsJ7nsytT/z3pHiuKmJGarszMPEmT?=
 =?us-ascii?Q?VNXJY2271h7LSVClDpqkWTadE0QnbePBiBRlh7Z/Ro0TE239phYYQwBoE80I?=
 =?us-ascii?Q?MfXvR2pJePX6yGrdE7YAi6MTZ8aiwyemcsuooF7EUUWxOUHzt7QGQbRUczTx?=
 =?us-ascii?Q?Jhrg9VgnsEFF7MSA7QZbBvEsw4zwUOMmLooPJNyQAs7fBTY+AsqD+L0vlA3Y?=
 =?us-ascii?Q?TzbLg0ddRJ4G/jY4vY189+NOvxNsYSlKgKUaG1qI5wsSqHqBwDvigXjS/JRm?=
 =?us-ascii?Q?rD8IS+sMReHQ0Um+0FWsvHM4hu3wwtTGFyrYoAJ96sbTG5aL/0q9d6mQaPVM?=
 =?us-ascii?Q?CLg5aAw2dlcozeaMhUB1GXzZOdd9TWUMne9WFXehaov6v8299WmwoMLAwp03?=
 =?us-ascii?Q?EqiE+GAHxbsp9MCW//Ihp6GgDaCy5KF+uXyOm4+h1xT3gvqApvZ+LUgra9SW?=
 =?us-ascii?Q?7kQdAwKtUjFIqlatp/2tmJ79jm+veorKB3YaOCd8ik/d7ic/U9NDeKDoK+Mx?=
 =?us-ascii?Q?nmnkeS+xiYYyV43Z6Y+RVXHDuaXrOsJWRhI40Xmfw9jFAou2Gsn0gFCUNOWn?=
 =?us-ascii?Q?nDdseGaFUfsomI5EdOrYwRIxrNn36heE1dcpoxh5wfg2dhLM5Nq98L9aX4B5?=
 =?us-ascii?Q?+3wdGodFMyKjR8uqMlJ4vMYaJ7EV0FNP3OQUZHrOppxdsOTnzIWbbKbovzJ8?=
 =?us-ascii?Q?s+fTIgRGQNJOEn+2L0C//SXnyGs2RbhfaxSVDKs/5160HN9+fDdqYsLKugao?=
 =?us-ascii?Q?kLylL9jcjtJzzPW4T+cJAFpXK9/7SzQySwLLSwlKwvSPMF4JnyBP+uEFnv4N?=
 =?us-ascii?Q?97Fi5h4EqMPuNI63HDf1Vld7twk8yegzWEBasuPjlSQiOPbs2euM0n1i2cvD?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	isYHLVhaP5Xqnf+lKHji/pzNlvx0XczlMnQqWQiipAj27Xas0U+a5/jobjjQTD/H7Vrgz6S2WcxwhcpHgjJnTPUL6bB9iSwdMmbpKxAvwtb3t+zYcunR2uDNTaVELDk3mdyRRH4rpkibYPFYHnBpMCGLjhsEl6vSIoKNWXbC7UPZnBFYFQ2TFLLJkYSviwmYFMtYKybkMyJ7EtdfxVqF+RSt+HoYte5alSs73FbFvaKWLE0xJXGYAmJ1EztjoL/Ld+UmnVT+BmIfq9XDbrZnjExcYoZWuHOqywP6znus6gQ9TBLarOGfmqaQiwqo6EgXEir5Zho748x/T3A2DJ/sowC2xO7a3O15rTDeZd8FSxt8dz4h0cuexnTlC2OR0OYv4n8f/QegodzEAj0fYqKLX1uPqdL+1GlZcLuEy6d3WELjyfWaaBGaVOhZ+dFDE4Ol819TyvIfcZAXNBi5klPRM8Ys3CVpm3IhsA8BdaYpvQG5Lpc0AMtJr86n2WkX2rhgW9ysVoQLH5prCM/XVJuRcN/88CzslhGFfMc7RtSLMZt0hsq/Wtw5ulv9n44tXNlX6lr9cECOhN1y/1YqH6hNHzhTXd6+24Ku/bdSRus2/yM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd741d3-124e-4b1d-c7f3-08dcfddcc824
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:59:47.3527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iAwiRemayrLZLGSgEIX63NPzUCKHpRMFbf80AZn2iBNVoget4AgxX+PktycO79og5jDUJaBWAnBJNTzZZQfOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7075
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050162
X-Proofpoint-ORIG-GUID: mFJH_1tFitwCTVnlO-N_Jqbo_SSqqYdU
X-Proofpoint-GUID: mFJH_1tFitwCTVnlO-N_Jqbo_SSqqYdU

This series adds back support for the probe foo (...) : (...) syntax
in USDT provider definitions.  The dtprobed side is routine, pulling
in the DOF and adding it to a new set of dof_parser.h records fed
through to the DOF stash and ultimately to dt_pid.c and eventually
dt_prov_uprobe.c: the end result is that the DOF for a given probe's
mappings ends up in the dt_uprobe_t in more or less the same form
as it was in the DOF.

After that things get tricky, because we want to map not only arg[N] but
also argN references (the single existing test for USDT arg mapping
verifies that this works), but the SDT machinery depends on argN being
left unchanged!  So we do the mapping in dt_prov_uprobe.c while reshuffling
things into dt_argdesc_t's, and tell the higher layers that no arg mapping
is ever being performed, then do the actual movement of args in the trampoline
by physically reshuffling the arguments.  This seems to work without breaking
SDT on all supported architectures, and is surprisingly simple (at least, it
surprised me: multiple places where I thought I'd need hundreds of lines of
complex code turned out to need only three or four lines).

New tests are added to verify that USDT translators work when types change,
when arg counts change, and when there are no args at all, and that dtrace
-vln produces the right output (all previous tests for USDT -vln, translated
or not, are currently disabled because they all use wildcards: this new one
doesn't).

We also add new tests to test that pid/USDT interoperability does not
break arg mapping and USDT args in general (deferred args are coming,
but are trickier to get working).  That's in a separate commit because
it renames and modifies an existing test significantly (it still does the
same thing).

We also fix a tiny error-path-related bug in usdt encountered in the
course of development.

Changes since v5:
  Moved a couple of mispositioned hunks between patches.
  Rephrased a couple of terrible comments.
  A few formatting fixes.
  (No conditional added around call to populate_args(), since
  populate_args() doesn't care if the probe is USDT or not: if the
  probe has args, it'll populate them.)

Changes since v4:
  Moved the arg saving into the dt_prov_uprobe trampoline.
  Store the args in one contiguous strtab rather than two distinct
  ones.
  Drop some unnecessary "no xargs, fall back to nargs" code (there are
  always xargs if there are any user-visible args at all, the nargs
  are not user-visible).
  Set up the arguments even if USDT probes with args find that their
  underlying probe is already in place for a pid probe.
  Identify USDT probes reliably and use this to prevent creation of
  multiple USDT probes at the same locus (new DTPPT_USDT probe type:
  DTPPT_OFFSETS is now reserved for pid offset probes).
  Fixed up a few bad comments.
  Added test/unittest/usdt/tst.pid*sh, out of the guts of
  tst.pidprobes.sh, which is renamed and modified to pidprobes.sh and
  called by all three tests.

Changes since v3:
  Rebase against latest dev, adjusting the trampoline: we should now
  handle the overlapping pid and usdt case, though this still being
  verified.
  Eliminate remaining references to 'remapping'.
  Move mis-merged hunk of dt_cg.c changes into the right commit.
  Drop showUSDT arg stuff in favour of Kris's improved version.

Changes since v2:
  Populate dt_argdesc_t's in USDT probe discovery rather than in
  probe_info.

Changes since v1:
  Adapted to review comments (all comments but the stuff around
  trampolines and arg mapping, which I don't understand well
  enough to implement); in particular track xlated args and
  mappings together, and move from a flags word in the
  dof_parser struct's DIT_PROBE record to an arg count

Nick Alcock (6):
  usdt: get arg types and xlations into DTrace from the DOF
  dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
  cg: add argument mapping in the trampoline
  usdt: typed args and arg mapping
  usdt: new tests for USDT arg sanity with overlapping pid probes
  usdt: fix create_underlying error path

 dtprobed/dof_stash.c                          |  21 +-
 dtprobed/dtprobed.c                           |  10 +-
 include/dtrace/pid.h                          |   8 +
 libcommon/dof_parser.c                        | 150 ++++++++++----
 libcommon/dof_parser.h                        |  64 +++++-
 libdtrace/dt_cg.c                             |  25 +++
 libdtrace/dt_cg.h                             |   1 +
 libdtrace/dt_pid.c                            |  62 +++++-
 libdtrace/dt_prov_uprobe.c                    | 186 ++++++++++++++++--
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      | 130 ++++++++++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  89 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  41 ++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 .../usdt/{tst.pidprobes.sh => pidprobes.sh}   |  56 ++++--
 test/unittest/usdt/tst.argmap-null.d          |  32 +++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
 test/unittest/usdt/tst.argmap.d               |   5 +-
 test/unittest/usdt/tst.pidargmap.sh           |  11 ++
 test/unittest/usdt/tst.pidargs.sh             |  11 ++
 24 files changed, 929 insertions(+), 86 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 rename test/unittest/usdt/{tst.pidprobes.sh => pidprobes.sh} (82%)
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d
 create mode 100755 test/unittest/usdt/tst.pidargmap.sh
 create mode 100755 test/unittest/usdt/tst.pidargs.sh

-- 
2.46.0.278.g36e3a12567

