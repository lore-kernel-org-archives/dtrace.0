Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E4C27CB31
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758218651; cv=fail; b=maxtwNRZvRxNwd6B8hTZ3wi9HO7p+S6HOF+uqKkFPEejIDRy6QwW6/rgN5vjbFKNPIshzJonoHMvfhhTO2dVD0W1qq1yiV9QAQ+IsHdyNrSizAWZ0Yc9o1YlkGTfoJrW7yKp+za6cGdeskZFHtGFGQJLYChcBNQFc/nwXOoGgxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758218651; c=relaxed/simple;
	bh=o4nEqO7+k+zKmlUl4sV1+mNiBIOO4U51m+Gts44bb9s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DhQIjHpQn39UmcVbfEcUhhyWpWNBiklYKVhI8M80LpsYe3hzkEQultQj+kwEhdSxf1Rx0vXWeLgXzI6npGo9jpaVVz7mGj6LZ6aFjW8Z8rzRQfwxku1nqXjzeDLW/LTpoU+uKFRm8YJwzLy0inIyxmPOpWnWC7T1QeAfMNsHpNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J2cHAMcV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=e5Ke6PM5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J2cHAMcV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e5Ke6PM5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IGNfNx002490
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Y9Ju4Yr9h1SATY95TmDYUYaOXHa/ri/8wh9VRFUr1mY=; b=
	J2cHAMcV27iQ7oIkfY4hWzJeyB8GizuSsE5UGXhzKpVl11yzRP+QQ0oWQKqwmmLz
	FizJG7WK19vIueFa13QiEDZSd2wHUyleKzCmXubFf2BFBnQSIrSlVjhgobNlDNwU
	32CF1hFpSIWxKDrJ3iJjgXFzWtKJgVRiZ0sgtw/xKF2K2Yo6RyisUBPOp6PAaOG8
	lGyRYli86GpDh6WCfvympduB+o5JNr3caTyndQmIWNSQnqazPpd0QnSGYKsOiJaf
	fLjjyEZLBolaaTtl2nxX44yH1kFqFLwJcNwL1mXYAz6S5y2PIOYh3GMZ7odCKb37
	TaNvrqGmjmL2Uy4NMPJpMw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx9416v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IHAbnW028813
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:04 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012025.outbound.protection.outlook.com [40.107.209.25])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2fgm1k-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 18:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOC0ugf06IkuDAr6/99sSqFHqf1X6qIBmnyTo/BFAaQ/mc5T20fVm85S1rubJaWpDiOnupVeWx7OoNEZ/hZRrAGgflf5YVNbL9hxQepKr8HnZcgYPyZdb23QUW64W4UKEQZGcZ1SNswVc6O6KzrrsVAHmSMy+7zQXyayDCQKHjPu8iWzWX3GHlXBHdYtVOcCNDar0Tv9vQ597RqFvqUNQHvMCxI9K3tIbxzJUnrshnbB3TyFtJ9AtY7xhFJHcsgr9On2tvCp/80fQErrWhAn/r6UPi/TQjFmWE+vixkhSLOtspnqpjD3WxgHHutbNjcF8BvaU6flsmWnIOtNhAMkAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9Ju4Yr9h1SATY95TmDYUYaOXHa/ri/8wh9VRFUr1mY=;
 b=vMKwbYju7AmY/hmBSecQ5MPN8P2uKq7EB0d3UdsJYUl1qQIv1nN45NlM4ODA3+Ftxze6MdPTFby4Nv6LMaepwL1/ntMcFG0RQBy4WwvthX4SeUKIoNOcRakXAyELaMHIoKtbleISmoYO/fEdZ7hxw8PUggrvoF0STqpWRlbEkkMoFYIVkm6tDN0b/Kg6uJbg47WJ4UCGJCusUzIyAHRzaO+MDcMpBkcsIrEIxhEo9nBkqFo3JFQBOEq98If2RvVCH5IGp4N3VPGo/Nm7B5olbaAKKENNRsJ04PLBnL2Lsa4+kLZV+qdddmlxYMGQXdlmbciO3knl6TE7xV5Hgr0ABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9Ju4Yr9h1SATY95TmDYUYaOXHa/ri/8wh9VRFUr1mY=;
 b=e5Ke6PM52AymkzyAh1afL+IJ9ycz5TsPFaxH7GCxstIQx1Iwh4xl6EUQvxoC8ujqp3JWYVxRpCZ1HC7Tb6ud2CSQBiPN+HJdD6mxstu4yKusZhr4tllMIhF3984JG3TdGQvWJN9PXLyPDk7xFkTzGo6UyAjwznPll5wl48o512s=
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b) by IA4PR10MB8279.namprd10.prod.outlook.com
 (2603:10b6:208:55f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 18 Sep
 2025 18:03:46 +0000
Received: from DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822]) by DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 ([fe80::2bc7:d2c4:e59f:d822%4]) with mapi id 15.20.9115.022; Thu, 18 Sep 2025
 18:03:46 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] lexer: the things inside an enum { ... } declaration are identifiers
Date: Thu, 18 Sep 2025 19:03:36 +0100
Message-ID: <20250918180338.197827-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
In-Reply-To: <20250918180338.197827-1-nick.alcock@oracle.com>
References: <20250918180338.197827-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0552.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::14) To DS4PPFA0EC85B6E.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d3b)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFA0EC85B6E:EE_|IA4PR10MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: c43268f4-379d-4b03-3327-08ddf6ddb629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xpvQ6XCwL//5uyuGtCc6Msor5dqi1Z8p5rCLhp/SASH1l0TvRNVOP585fNtt?=
 =?us-ascii?Q?5H7PnY7aHeRdsNLKuW9hCeKGhMXSI8Gof8vfCrOHU+k6ev83tcwdZ7TWZ58J?=
 =?us-ascii?Q?dNn+d5aqJXdgw08V8q54wxzNmRwV17+Uy5k9UyhYEw/DmgXKLS+GkiPQSADa?=
 =?us-ascii?Q?g3JO7EnFWoD+U3WgS6aIe9y/hcYUe3rzbTsAy8ZTFurEWjfF2iTy0pkc1K4n?=
 =?us-ascii?Q?LiadiUrngbQpuQ+CDTQZhIFptykFjLtbyW3laPUu5921wzQ+15B5qIcVxkBC?=
 =?us-ascii?Q?6UD6t3AfctP99wyC6O2hvaAlwGlwBB0gvGPfhQ5r+Zf4rsCWVEC4hLoORtWe?=
 =?us-ascii?Q?bgsZhsGdgKMv6TuyyzkvZLok4g6BWvZn+2Nt2RJ92fmm0qonRUPgIdyE4SYS?=
 =?us-ascii?Q?0h0NPVPEdmmUju2+QQ8FsuID72Mx6a8DlATTPwMJwpSZ1yWKMmiIokPI3RRt?=
 =?us-ascii?Q?3YJ0xZKDCKo2/cEmQfZ/l2djEHhrHyXK1PL8MKqWkCcXK+7yDT19rDHPQ106?=
 =?us-ascii?Q?7jfW3EHYv3brqqmgZ6shtZfQEZASogVuw/VyJ0YN4yuKIuVikqt4GBiq30Y/?=
 =?us-ascii?Q?gk19cj6V2FifKj4GwGK/IBmIhExqBLdUTzOXo9b6N09zyYu9R7B0yYnbdR0I?=
 =?us-ascii?Q?ZIpfmPxjwSwsiSoBcwDHNR3OiwF4vrKAJOqyICxTNv1UcybkHEOzLw2bguUq?=
 =?us-ascii?Q?kB5EjhgY830Y6BRrWO1cMGqHSf8fEA+UArZOxOsMf0rXZ5uJEbzkyc4iIuud?=
 =?us-ascii?Q?14Ci6o5NCvD6ljvhCH0W32mTWmYtJxhbFaUWqcQh/BG8OLJNidD8duj4+1oC?=
 =?us-ascii?Q?xrwwZ4h5J+FDqxE8Ef1zrfLqU0z2S6V/xurmhHudAcNVSkqq4YaMCeGWBDKF?=
 =?us-ascii?Q?w0qQIo3sSvuiXdsBcrXiaLRZMP6DSgvvxyB4WmR/3UPS8YeUzHWJcFwxCH5A?=
 =?us-ascii?Q?mA0jRFBfB6SCuDdX79JaE0Q35GcF7O3MU/vAcyRE2oNZprlyA6IXhTMnIVtZ?=
 =?us-ascii?Q?Fpeiik7hovweY+DGRPBmpeF5e6u8nLDINuOc31828V3Lv56/ri4ysaGFN1A+?=
 =?us-ascii?Q?B5j51vFt4q7jRPFs7gJRZ9f/knE1PPMEsiWVNWjIRURsOVUkLFXypg9V/3VY?=
 =?us-ascii?Q?uMnYSt8vGOwaNlYbLsZ2GQ0uxhmuuAAzMbuXBZK6hFKStX5Ut6XL1g2Y0b0D?=
 =?us-ascii?Q?bNbyyyUPzM2vR+8JskxmXocDUQy3BETnjDtcQlHH3PtBQxOb3J9+hy9tM+7G?=
 =?us-ascii?Q?r5km5lEDvFZdfkD4OEo1cJgLVC7GgLOX3LCWSgN7KXBW8s3GobgaIImy1w97?=
 =?us-ascii?Q?Jggrn0puuGAA96wxN1lS6o1y6kG5ibYxs3NdntC/fsgQ+etorTQ2TxLUyp8n?=
 =?us-ascii?Q?pePHSavY0NJ9MMitbMdKIfAbQbDmGo4TgOzOABXbPU/r5PoOam3I1iu6cbq9?=
 =?us-ascii?Q?j+jPb6GlcAU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFA0EC85B6E.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H30ZjpxuPF0IyBtMu17slhdZncSUYKlTCN0S15IuG1bzB6o7y025iGf6rXoA?=
 =?us-ascii?Q?maG5QVUA7EtUG7LPaQLeP1jiG5hGWid4K2ZautctKb19K7KFGkZvRhQvSFja?=
 =?us-ascii?Q?Kz5gOlvdfG/eL0F9/jhz1c+onuF29ndfdDAuNaYpGxP1XN7jJRhtejh14e6w?=
 =?us-ascii?Q?2pWPpq1Kq0mD4x43lHYykr27om9mQVHhC1nVI/CLgSQbhm7l/1YEDI5GrdCm?=
 =?us-ascii?Q?dWKvRiTSYyMWdOG7ghzXLMFdQMyVmasn3dXV0tMS7eieFmfvEMn75wknYnAB?=
 =?us-ascii?Q?ZibQD96B3BWU9M8dR23yFUmwDRDVJ4mOaYJLVF4+5cOFZ/1E7qVo/EFHcc55?=
 =?us-ascii?Q?Yq0+gWeBs9K5hMzOYGcgMdTBelUeBwTnn6j0Z6xUYlDGFxvSVQmLocCv4dpK?=
 =?us-ascii?Q?ChYZz6rjs1zG+hUjYkJkTYxgpJQbSzUyypsdsbvTBb1cIPEjUbkDM31Jun0/?=
 =?us-ascii?Q?3vQh//VJppIPpMEbl8rMYTY1OyoFK3b4ScnX6UJLNfDyVWWN5adUzGNEK9P/?=
 =?us-ascii?Q?vRGu3RyJgPtlTFyl/TzWzs2HBRTqXxy15T1vIpQXT1900sbmL/JQkd5r2gVz?=
 =?us-ascii?Q?y+TYSGeXEM1HTDMKwwVQWjWB5o5TdrXTtN5g+oH6AVhMltfa9PIbqXbWqHH8?=
 =?us-ascii?Q?b+63uNbt3oooTkK3SUO+9k1lSPf9/36ms6m18yYEVe459aM44GIODH2eDO5/?=
 =?us-ascii?Q?eq8nRmQ2iGgeeO30vtioEIzLowlHGAULQQrIug1cdurTC66wh+dG9x4+jLbF?=
 =?us-ascii?Q?U02S0h8XXoWZZlp/WGRFVvnDPWtp4ubfShXQvHPVksOv/PObcFtI0Kr9TYHF?=
 =?us-ascii?Q?wVkBzMMTeBGgvb9PYE/mZ0ZUNWmln1E3ClB1+h86x9/qN7ST8IvITsBYFQBz?=
 =?us-ascii?Q?BPes+mwmZN2zvKbd74PDKhbRa+aA2sKGdjfNIfnigAqzgChpK3YcQbZE6JJS?=
 =?us-ascii?Q?pqvWO/++kyCHm+Vcyv/ZHNzwD+cW54oBJv8qZbK3KeOjepVo/GNvSjTCNMb5?=
 =?us-ascii?Q?MRxTEPwwbRg6YH/ySg8L1L4h4t4oY++EXQp1SUGr5YhPe2pTbEgWZPHn20am?=
 =?us-ascii?Q?6b+L0i+TGUfnnUCVzPNscsCC+vXOalrmaehJmrOPmkrAk8aGSSEEDvkvtKj/?=
 =?us-ascii?Q?/Bu5Y/Tzq1dY9iEh25BkjXPwMvgOqmTJyrsTOZWQXnlNyrX0+z6LrpqMvuZi?=
 =?us-ascii?Q?VBCmlmNRdBrEFUmEjpggYj+evyfp4lI/TbPncemetKDLXkIkEsGijm503JNe?=
 =?us-ascii?Q?F5nnI2aG5IoJSKUJ18kAls95/tURw7oaAH9S+tnOOfsDhchyDsJw+de9HaBu?=
 =?us-ascii?Q?BztR53wXSuR3sFqVxf5I7G5EokYffRJH0apvtWr3Mzj15RR4JgQYOhw7pwav?=
 =?us-ascii?Q?lXs5PqpFQ8dMQnhbY7menxusBJMd3Cj28NxerjBqS/07evvbojoWcHE6e/51?=
 =?us-ascii?Q?YsY/JLvfBvJxudyScBP3BswstaJRiPHBz+OIe1eYRCe2OpKXgiDBQbOZ1yUE?=
 =?us-ascii?Q?q3XYWBS+DTVJqPDqaAjDXaRx7TKOf1VX5J27nKC8MpnUHx0OJYq/gvycnv19?=
 =?us-ascii?Q?FDPlbg24faLdfGgktLngt31I+vIqLx11anc8oOgaiwykaF0fIozKCmWaoaDD?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aM96Ou6MZxWOox8GJz18cVunQ4S0Zsy2cBbKsoR4JmQFL6IRAb5ZzZwLNDSyZmp45KHp38cFbROSvgmWu4itCb9U4N22jv8YbmpuzEOilO1brFgq0AtBuyAkic36UdMwNoCz4IFq+GK3XS//y8Jb+Sc6+urXb9WZUVCZNdQ1v1s7u7a8kiRPiFZjXKvuf/+i61gRHlYT1B5GJFi7dQL05UqWswpKX7GpkWk9Zev5DxyysOXsNE6AAqEL+SuDibVGkqO2Vlke5Sui+UH2WhyVFD6fJsqgAbOKonUSzS1ul3Z50mDveUBGj017M86DaxSwsin8c0w4+qD8O7DgudqDvPwuaMX3RCXisX7ZBAxJCDSowca1EaVB2fSkAKEvNez6AwpBmPfMwwX/QBfnweZjUKTSXTie0aUamHMaVVqjjoOVvLmmu5S9elYlyCXP5M0WyKQtq7sV2oa2Ivs8tAQVAPkOP1FTeX5HmBMFTRts6i8QVvA0EgV6qUzYLPL+Ts5zw5aZHdCZqj5HQ8oBIBUy4K5zR58ilqzciBT2+NRr/a4ULKB4YkbxYTsgEZkq4XcJkFZiqVN/ocCBqQhXWlV11cb7V6j7cjFr6IUBoEFQdY8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c43268f4-379d-4b03-3327-08ddf6ddb629
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFA0EC85B6E.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:03:46.3149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Uuk6D1J8p6u4IuREIjel7Gtg+IBY7gKHpbNsucuw+QQFtWw5pH3AvRiSUwcFXRti4bSJoA5pvl/plhrNMoWXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8279
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_02,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180160
X-Proofpoint-ORIG-GUID: DZxcWO9i86D86vGBZ3LLn4kDUov-kBGu
X-Proofpoint-GUID: DZxcWO9i86D86vGBZ3LLn4kDUov-kBGu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+/fR9kzT8jfW
 HVq7Ea+swAWYKXe8wJhDPmMze1sAeXOwc9mIqZjjMf7Im67hvhcSAbQlCS78ww0lwgHkWQzk9gr
 jDQWE6J5hRYAJmLcTQpPqLUMaSfbyRtRAl1EBuHZAdM96q9vKLkSHRrH+XH1WJ3aINORnskTExK
 KR39diXtW0XZTMSQYOVx72OYEnAc5jBLBxoNECfUd5IRZpM/wp8F+fAdKS5ShXcHxW1ITFkh2cO
 xD3/MAR63h2w6gmd6XfJK4pyqtL7XwxmWVTt1cyBKwT5S3CbIGvLkeUEtURKFk1+Mt+w8XwUrCQ
 9ySiJl3yylPfOhSt5dSmY63CboVrw9lf7H7WbfTKRsgf0Fr+snehQFhmy4CUUTWkOwdne+2B2NT
 Ewj1VJvw
X-Authority-Analysis: v=2.4 cv=N/QpF39B c=1 sm=1 tr=0 ts=68cc4996 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=u_Mev--n6Wzo8ivECekA:9

The code in dt_lex.c:id_or_type() tries to figure out if something is an
identifier or not: if it cannot prove it is an identifier, it concludes
it must be a type name, which later triggers a search for said type (or
identifier) which eventually reaches (expensively) across the entire
kernel CTF.  Usually this is what we want, since we use type names that
actually reside in the kernel extensively and do not expect to have to
decorate all of them with `. But if this misfires bad things can happen.

In the case of enums, existing code in dt_decl.c checks for duplicate
identifiers, and carefully avoids considering code outside the C and D
dicts to be duplicates: but if id_or_type() concludes this enumerator is
probably a type name, we'll import the thing we find even if it's an
identifier, and then conflict. Enumerators cannot be type names, so this
must always be wrong (if we actually do put a type name in there,
dt_parser.c will correctly reject it no matter what the lexer says).

So add yet another piece of parser context identifying when we are
inside the { } in an enum (we set it to 1 when the enum is seen, then
bump it when the braces are seen, so if it's 2 we are in the relevant
context; it is reset to 0 on every ;), then use that to forcibly declare
everything seen inside enums an identifier without trying to chase it
down

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_lex.l | 17 +++++++++++++++--
 libdtrace/dt_pcb.h |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
index 9f12f5c7ca289..fd70aa0aa5803 100644
--- a/libdtrace/dt_lex.l
+++ b/libdtrace/dt_lex.l
@@ -88,7 +88,7 @@ if (yypcb->pcb_token != 0) {
 <S0>do		return DT_KEY_DO;
 <S0>double	return DT_KEY_DOUBLE;
 <S0>else	return DT_KEY_ELSE;
-<S0>enum	{ yypcb->pcb_sou_type = 1; return DT_KEY_ENUM; }
+<S0>enum	{ yypcb->pcb_sou_type = 1; yypcb->pcb_enum_decl = 1; return DT_KEY_ENUM; }
 <S0>extern	return DT_KEY_EXTERN;
 <S0>float	return DT_KEY_FLOAT;
 <S0>for		return DT_KEY_FOR;
@@ -128,6 +128,7 @@ if (yypcb->pcb_token != 0) {
 <S2>counter	{ yybegin(YYS_DEFINE);	return DT_KEY_COUNTER; }
 <S2>double	{ yybegin(YYS_EXPR);	return DT_KEY_DOUBLE; }
 <S2>enum	{ yybegin(YYS_EXPR);	yypcb->pcb_sou_type = 1;
+					yypcb->pcb_enum_decl = 1;
 					return DT_KEY_ENUM; }
 <S2>extern	{ yybegin(YYS_EXPR);	return DT_KEY_EXTERN; }
 <S2>float	{ yybegin(YYS_EXPR);	return DT_KEY_FLOAT; }
@@ -463,6 +464,7 @@ if (yypcb->pcb_token != 0) {
 <S0>"("		{
 			yypcb->pcb_parens++;
 			yypcb->pcb_sou_type = 0;
+			yypcb->pcb_enum_decl = 0;
 			return DT_TOK_LPAR;
 		}
 
@@ -488,10 +490,13 @@ if (yypcb->pcb_token != 0) {
 <S2>"{"		{
 			yypcb->pcb_braces++;
 			yypcb->pcb_sou_type = 0;
+			if (yypcb->pcb_enum_decl)
+				yypcb->pcb_enum_decl++;
 			return '{';
 		}
 
 <S0>"}"		{
+			yypcb->pcb_enum_decl = 0;
 			if (--yypcb->pcb_braces < 0)
 				yyerror("extra } in input stream\n");
 			return '}';
@@ -536,7 +541,7 @@ if (yypcb->pcb_token != 0) {
 <S0>"--"	return DT_TOK_SUBSUB;
 <S0>"..."	return DT_TOK_ELLIPSIS;
 <S0>","		return DT_TOK_COMMA;
-<S0>";"		return ';';
+<S0>";"		yypcb->pcb_enum_decl = 0; return ';';
 <S0>{RGX_WS}	; /* discard */
 <S0>"\\"\n	; /* discard */
 <S0>.		{
@@ -769,6 +774,14 @@ id_or_type(const char *s)
 		return DT_TOK_IDENT;
 	}
 
+	/*
+	 * Inside an enumeration declaration's { }'s region: must be an ident.
+	 * Checking for conflicts is handled by dt_decl_enumerator().  No
+	 * need to look anything up here.
+	 */
+	if (yypcb->pcb_enum_decl == 2)
+	    return DT_TOK_IDENT;
+
 	/*
 	 * If the lexeme is a global variable or likely identifier, then it is
 	 * an identifier token.
diff --git a/libdtrace/dt_pcb.h b/libdtrace/dt_pcb.h
index 7c57f83220b28..b6a7620f4920c 100644
--- a/libdtrace/dt_pcb.h
+++ b/libdtrace/dt_pcb.h
@@ -71,6 +71,7 @@ typedef struct dt_pcb {
 	int pcb_parens;		/* number of open parentheses in lexer */
 	int pcb_sou_type;	/* lexer in struct/union type name */
 	int pcb_sou_deref;	/* lexer in struct/union dereference */
+	int pcb_enum_decl;	/* lexer in enum declaration: 2 for inside { }. */
 	int pcb_xlator_input;	/* in translator input type */
 	int pcb_array_dimens;	/* in array dimensions */
 	int pcb_alloca_taints;	/* number of alloca taint changes */
-- 
2.48.1.283.g18c60a128c

