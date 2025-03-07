Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216951AA1D9
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383324; cv=fail; b=MYuZvWkBGlXZ/QyoIBe8qK+KIaXiroVBi51Rm79Q2ppFT7Lsa+MA4yqof0O29dT5pDazNDO/jEZmMbvN3AR5HW533FFdtbOXx/4+8FrMgyM0s54MCNfUKiK01PLm0lKeSWw6vwIcodtzKtERXGh9l4SWTkeo917jOG4DSL7MXEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383324; c=relaxed/simple;
	bh=5K9yJoymzYVndybJ3lma3oiMMBXSDM0zJi+AnJqL6Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DlrtoOChuabPdKAeFdkMeuMpUTM2ikrYFxW/Zr/bcvaG5gDuvLBh+a869oksyCnqRBJ6MthX81aBZuG5rtQIg9h1aUN7Pc/EnIRGK+RbwSm6rkRigJg4dG/3F/0jC2LUhm7QysN34BDgO2Rell66MvU56KrKLtyiz3aCC0X043I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Reqd2aYs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dFNjI2N+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Reqd2aYs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dFNjI2N+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527LIMnN008216
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=SuZ48bLIwA9c0aUxf0V0rU2klyP5bnExPHdSXoYL0zI=; b=
	Reqd2aYsbg1m8gQ2Q2tz8MZEJ852GE0tbV21c8Z0gpLT9Y9jj4RWyLfoZ53Viz4d
	gxZW0BZwZLAguzH5utsGyio3g4C3TZlxJ7dFhB3vLXwD7mq4oYyNmVVTm+nEt8Ao
	Y8Pcg2dA0C9i97WoASKQiKcLz4tJb2p8tqUEPos4pUUdMXPe5+fjAdB4LJ9aOQGu
	c3ShRjMhWDqELpJV94vAWzvl9DejlrgNYWS9T5eVoGVgDDdd9My8P6pA1lk3B3dc
	D3ZP04lXByz/nt5CqtuiziTmgj8guv80g4+7Se74IS2/qKS1ygi8mtN4iYiiORN7
	bkBbJ7fmlLq9UXTqMECwEA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453ub7d7d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527Kg5OS015691
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:15 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 453rpf4h0v-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmuSitCDfEDSsR9w8XeRUzjYJF191l9Nkww0VjhOlpx4SnoxeBVfLRIY0dn2kulLxXuHPYhalAPJRDBrlPdiMN373e3yAaCb4AMx+15qBpI+rAlETA2hN7tl61q98SUZcX69BPyz4GVH6a43HN7XGGZgB/p+RWd+hH7F2TJgkiH9wzPDHV+dgcqwjx/rPxFoZuU5OtTK8klLlNmVaandjs3yLYlVhiWKtld8qc3eZZvt/wwMnxKMhDhIL6Ty1j/Y83EVt5e8IdzlLi1xqTpD5V3/gMVXbipLlJ/M/2stadI/zzw2jTC+73jvgbxa8X0Sf0sqydbvrSdn6ioGoV3fTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuZ48bLIwA9c0aUxf0V0rU2klyP5bnExPHdSXoYL0zI=;
 b=OLX4otJelUltRnl/Rcg0J0iV9KWSkUnGSDihW5Ofg5bpie/pFIseQ/KnaZ/EVrpx0Y8o8shUP0IviwTJ6JVdBQbbM3G3GmdVqkUN2ru+T2/p/TT0MJly2GFJr4oGXOjZxzhCPXEjnj4jpsNYkv3zU+ifhgk8dRiVFXGSN7BQB/RzUJX7D6BpVIjf3GE9k5kRjWe5RH2q0IXZCFwtorUVAFIqDRrUC/kcDD4AjNgBjVjauj5CjE18kG731pql4ajE66QtCMqAp/Xo9HFzE2b4PgEq9nKyCAkU5k9SOEKr2OSefDXZofnPYSMuUX5LYd5sJyHqU29YW0K1HCFo03g0Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SuZ48bLIwA9c0aUxf0V0rU2klyP5bnExPHdSXoYL0zI=;
 b=dFNjI2N++rG4X8dQriyX25x8PwC56FNNDb61MEWbzIcZRLZ8FGNHr/2aieaTTfK+kyxrpWxOF24Qdi1B8Ahdf0c7d3Ub0VzUJtZLl2m+2umk6TpoT5jPPdCjUl6J/WjReW735K2kITmkf99yyytPkwkgSeTc0xV8CrocCrtX3Oo=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:35:10 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 21:35:10 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH 8/8] fbt, rawfbt: consolidate code to avoid duplication
Date: Fri,  7 Mar 2025 16:34:41 -0500
Message-ID: <20250307213441.9495-7-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250307213441.9495-1-kris.van.hees@oracle.com>
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a5506a-bc2e-461f-c763-08dd5dbff01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lfIeU3uJX7yuby765klqE40FGDFGDsr8ZkzgK8iduMmg0DBfQvwuGQO86Xpy?=
 =?us-ascii?Q?ICr+UuqPOga1txZqVLMwC6GlknGgj5fEJsEIeKBtHjJVGLau3TNGKQVWuq1N?=
 =?us-ascii?Q?YzXt7zgflsJMV0lPc3yr2qSGkA9efSY8jQsaRnaNvKx6ci4VPcteprK0PXPU?=
 =?us-ascii?Q?hofJy8ZhiziC1HFRgL5rIIsoA/eNUL43tn0Ja5TsVebJ9kFw7aqD/5V/vezO?=
 =?us-ascii?Q?wr6Y+C836uWgJZE5hZu2WabkzVxAPD5FbG9HilcH4McyUVVuET0NDa4mAJEr?=
 =?us-ascii?Q?jo5SfAAvqWCygXBkEePMiknPRO802PupslPPk8ZfPrghKf7maFFyxWhu60P8?=
 =?us-ascii?Q?vdXYJG4TUi8kLN3/a9vVhNox+XkEOwtaQFMmieIpKB3HynTP1yo1sUvVwtZ5?=
 =?us-ascii?Q?ib5zIYkWfA8+vu5YXQV+DcHmmCbkK1cf7EYOo46wzI3s/ub96VYuwg9t2MIG?=
 =?us-ascii?Q?ZxcaTZZX24hx74ozkrgxEw7TMJG5N4IraJiwvT7Pf8UsNCJuui+X5TmEjunE?=
 =?us-ascii?Q?VrXHnqKxqKh1YZfHe/KkWCIefaT3y/gW3bB/LGqCERIWAitrCchZC0RaTgIo?=
 =?us-ascii?Q?79DpTdN9/PCDajy2H+OFRamGGkVUQ7GUGPOUBHyS7rS36ebtTgB7/qjXY1NM?=
 =?us-ascii?Q?4vYvEKXRoOmqc3WHNYQR1zrXtqOpc18yqtu1TyXLz47pISVvxGylFb7Bo4c+?=
 =?us-ascii?Q?REGzlf3eVIMn0Rl4jnJN2zE7WQ+uS2uQmjlFxLSRCQOgoQICvVT7uk5W7DVo?=
 =?us-ascii?Q?FR+94z1gdm+fWinmJ9qOQ9p6lbUthnsXZTtq+lnSh3U7b2JZEb76v9QNtzDG?=
 =?us-ascii?Q?qxI5EE00etzROLIEj+19FczU90Nq8vMn+keFh5p1sGFQb6CEuGtoqJ6OLfeC?=
 =?us-ascii?Q?oxjAPqX8r2RbpY907YbWHwovn+wRjKcmwWO4JLVHZSe0F4zz03zgf0SIjo7v?=
 =?us-ascii?Q?hgFRJpvQj51GUMKa4J5tjqFWuRhaUwRzBprrOsssXOlgfY/XLQxTwMqdvQ/r?=
 =?us-ascii?Q?dQQzOP4Re6zShKBiTcm7qunIIZ7Xcmh3SlhpleHIxyTS7TlATVd4HQK9gsd2?=
 =?us-ascii?Q?pjdyZp4w3tQ0idJSl96VCyiu7bzV+nlv+PB7zeSoOzntqRt2QUCleUewDc2n?=
 =?us-ascii?Q?6lRrtbzww0H7VMToGLhcqgBhomxxQMMo4jG//0gyzstKkaPmMy9NA0M1naI7?=
 =?us-ascii?Q?la1Shs0+ZYtIFOEd9RTV1Xpwe1ZypoM3J3DtazfncViInduDHabbU1JZGCYj?=
 =?us-ascii?Q?EpqLWqPClIKdZg/jfLwUJRoAzZWvyr+urX/jfNiuXXnuPIUJQv748QsqCJoA?=
 =?us-ascii?Q?S1yMXd76kFJ8BiqdjZ4+XolleqvyV2ds5InUEzY8MScB1KtHyKNxnRUebOG6?=
 =?us-ascii?Q?8oaxJ1FOvcy2SlmgZFhIXAuF1wfi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AEXq7vIcA/zqUyWqb9IkJMuBnI3P5XXgliAH71/Gvh4MqfSduyWXOKtsw7vl?=
 =?us-ascii?Q?hBCTvjXL2TrAd+++Zesp9NHLfRNM0kONiry5o3hPdVMF6MliScLb0e85SXi8?=
 =?us-ascii?Q?nPljvB5dhedtbhm/zssvVND+VjsXg3TkPLC5w98MEbIrVczRdkrsvbZ3yG/x?=
 =?us-ascii?Q?rCnexuH+TF+IUaCSmDR+G1N/JpLgsa0kBLYetI6VoHsPIndGNMFSJetJleKO?=
 =?us-ascii?Q?QYDnZ78nOJ8AjYUe3D3/0DgdAjwg1gkDKJMSq7Dcrl/VvyhAyQ/dhDaNkPxp?=
 =?us-ascii?Q?olPYz9wdJuqbHRdkKh7SKPf+f68j3x8yfm88zHdu2nAffgeTB0FCkvz9w5ZN?=
 =?us-ascii?Q?TplhK/aWByF7DRZ7IdtvQg9CiYJtREReObyafF0nl6gu45rhfzjqyNT9CxYO?=
 =?us-ascii?Q?SbFPS/zuM8Igv9Ovz+R3XxkNbcYg+2NITcTEusMgNSvqO2Wk7eEM/IzPjcRc?=
 =?us-ascii?Q?d6sXDK6/ObtP/DchS74ZOpvS+lIvUYdSfru4iFWt3Bw2yBnjXdd2lqUonll6?=
 =?us-ascii?Q?WDbK+hwGnByE9NL2gtM7WwBSAwdsohrmhBZ2A5QwowVHJMi0Li1JBOGwEv/A?=
 =?us-ascii?Q?zfqBUU4+D0WB+QJS2z9lPwH+lXCMLJV5Su04IQZPQpz2KKMMgw/fCGmOhabX?=
 =?us-ascii?Q?WqtkcTbbYS28mRsPLuHn4GI/JLT+1e2mb1PwpknJU6HfB/vRIqqY3yCcZ/yD?=
 =?us-ascii?Q?XU8ALouLTuxF30yF2VQa9rI0MMqd+Mcg/XNksctoyGX7S1vD00pvbOX5lj1u?=
 =?us-ascii?Q?8HycvlN3baKnjsq3Atnb4JKhqbSL/MJCiKMkK1VMRX73F7yJMAXO04do9g/B?=
 =?us-ascii?Q?yuZkEsHQ6OFnYv0jjj4kru0MOa8bymJnspO9mcKAKYDy9FFFzzA48FTonx+4?=
 =?us-ascii?Q?KA5UwNi41kgYzTu91XJMXAzI2sXKTZ/TVhCc8OpZf5P84RKGl3R7+3uHzudt?=
 =?us-ascii?Q?kW4drMs1sLo7KHLvDisLqosgedPt/8IaaeE59iONvHQ9q3/K/K6YGczYCC5V?=
 =?us-ascii?Q?eYlEEJOX0EEGrwQfu0ZkvIHPQnYVZ4IP68TSvLEG15ODFJZEkz6GF/wqw2Mj?=
 =?us-ascii?Q?x4KazIgvNwm2xXjxeaVkPbmCo1CqfDzD5Zza15f0FzGGL2UsEFUc9osDCIEa?=
 =?us-ascii?Q?53SP9KoBpQbO/0G+B/fdFD5SK/KhZKS0Y7gUAmsSGnz0Dvkuxh6ab04Mfr+s?=
 =?us-ascii?Q?Jv99EvvajQAUDX9i3d/B1XaBCSHX4Kjv+67ykX6Plycub3P4rG7CmCjysCuV?=
 =?us-ascii?Q?nr4KcRF6G+wygJ4JOAIHZGhHqomHyM5ZDTGetMbPHjQH4bxZYwoTVWLCKoWy?=
 =?us-ascii?Q?GGU6GizqJsuCcW0jqZ2ZmKcD1ymX8+r/JAUQ502Qxj/MNzWIiwUV7UibAW49?=
 =?us-ascii?Q?N2eWjj8BSi+QCeVTV2EiPGkSS3LnTG1fQkOG0gvpCBssZwWNAowcAZJHyui1?=
 =?us-ascii?Q?J7EMIMV8frojPN2UiCGcXVqhmyWMcQm2J8JcQX8zeGhnP0uoo0wBzVnc5fOp?=
 =?us-ascii?Q?Xnv3/sf8X+mjDtyC16NCJ+tkpJmhMn0Z7T/5cAshKI3VXr96ToG7/yH+usCm?=
 =?us-ascii?Q?TIdHG+nTtYo0zskpczCh2TcbMufW+3yHLqyDqBc9jdHGX7nj+AS7qcroIQ+G?=
 =?us-ascii?Q?0rLozFOEwKkhN0RIdV2nkjs=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fc1vwQzTNIhof5yQ992ec+rIW31CmdhAkBOPCKVJ793TneTH2nH6yf0nw7Wei7kt62RPSe/mHd2nRiqaQAeY5GlM60hX4gDHfS+qq+K8dNn9DHszGE4z6kxTN6gzJ0puvvLmyguBmiDAV1sXypTbkb6mhFe12Y0UffhbclKDAgqebu2adWlwjmopfRULlNJDMhEetZO0iThPXEYwN+JbD1OghWsd2ikw9bv7G47WTOBRw0JXC/mEQC+LihY1JFD8cv9RNy2g/xCn3oNViiY9Uh4iJQx9JAeNtQBGMgvL5kZjt2mdjwgE5Mc0GFVdhnqccifNprkKln2S3XnIyMccR2g8Z4UvWayqf2/fWAn0AbB4dP0wzBuwthV5i/oeThTRNApdcdH6IgHop12kQtWOmRUY/VL98wirSTC2VbYWNE2DkG9twK+KXfTV9Pt3RPHI7O2iVSLOe8qg2o1gOtkHM6YxfJO7lAy0LNE4wR2XtY4Ysy/Gyz0xzqCCspF12tWnkrlIriiDrmbFDB7Q+u3MCAMhJD9pecBNkLL5PhsVBQb670o9Rtskveboahr91NOkcFf0+E6I6irjfwaRJPoIU2ynQsGOMVpTIS5Zc02kcdo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a5506a-bc2e-461f-c763-08dd5dbff01e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:35:10.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Th3RDkCvp3Jez6JL20UdxMSgd2rTjEX5Ovxg/HYttipBtMD9ule0i3CG+gU3ggEmQiVcD2yky2N8dltjjeZK0qZ/uNNADvm82J+haBtCrzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070163
X-Proofpoint-GUID: cBNZp79sVSnzbGpWApk5aIRIzjcOvET1
X-Proofpoint-ORIG-GUID: cBNZp79sVSnzbGpWApk5aIRIzjcOvET1

After optimizing both fbt and rawfbt providers, the resulting code has
a significant amount of duplication.  The rawfbt provider can now be
defined in terms of the kprobe-based fbt provider functions.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build            |   1 -
 libdtrace/dt_prov_fbt.c    | 131 +++++++++----
 libdtrace/dt_prov_rawfbt.c | 393 -------------------------------------
 3 files changed, 96 insertions(+), 429 deletions(-)
 delete mode 100644 libdtrace/dt_prov_rawfbt.c

diff --git a/libdtrace/Build b/libdtrace/Build
index 51e0f078..7e6e8a38 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -55,7 +55,6 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_prov_lockstat.c \
 			  dt_prov_proc.c \
 			  dt_prov_profile.c \
-			  dt_prov_rawfbt.c \
 			  dt_prov_rawtp.c \
 			  dt_prov_sched.c \
 			  dt_prov_sdt.c \
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index d837e14d..93ed270e 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -6,17 +6,26 @@
  *
  * The Function Boundary Tracing (FBT) provider for DTrace.
  *
- * FBT probes are exposed by the kernel as kprobes.  They are listed in the
- * TRACEFS/available_filter_functions file.  Some kprobes are associated with
- * a specific kernel module, while most are in the core kernel.
+ * Kernnel functions can be traced through fentry/fexit probes (when available)
+ * and kprobes.  The FBT provider supports both implementations and will use
+ * fentry/fexit probes if the kernel supports them, and fallback to kprobes
+ * otherwise.  The FBT provider does not support tracing synthetic functions
+ * (i.e. compiler-generated functions with a . in their name).
+ *
+ * The rawfbt provider implements a variant of the FBT provider and always uses
+ * kprobes.  This provider allow tracing of synthetic function.
  *
  * Mapping from event name to DTrace probe name:
  *
  *	<name>					fbt:vmlinux:<name>:entry
  *						fbt:vmlinux:<name>:return
+ *						rawfbt:vmlinux:<name>:entry
+ *						rawfbt:vmlinux:<name>:return
  *   or
  *	<name> [<modname>]			fbt:<modname>:<name>:entry
  *						fbt:<modname>:<name>:return
+ *						rawfbt:<modname>:<name>:entry
+ *						rawfbt:<modname>:<name>:return
  */
 #include <assert.h>
 #include <errno.h>
@@ -57,18 +66,19 @@ static const dtrace_pattr_t	pattr = {
 
 dt_provimpl_t			dt_fbt_fprobe;
 dt_provimpl_t			dt_fbt_kprobe;
+dt_provimpl_t			dt_rawfbt;
 
 /*
- * Create the fbt provider.
+ * Create the fbt and rawfbt providers.
  */
 static int populate(dtrace_hdl_t *dtp)
 {
-	dt_provider_t		*prv;
-
 	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
 
-	prv = dt_provider_create(dtp, prvname, &dt_fbt, &pattr, NULL);
-	if (prv == NULL)
+	if (dt_provider_create(dtp, dt_fbt.name, &dt_fbt, &pattr,
+			       NULL) == NULL ||
+	    dt_provider_create(dtp, dt_rawfbt.name, &dt_rawfbt, &pattr,
+			       NULL) == NULL)
 		return -1;			/* errno already set */
 
 	return 0;
@@ -107,8 +117,6 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	dt_htab_next_t		*it = NULL;
 	dtrace_probedesc_t	pd;
 
-	dt_modsym_mark_traceable(dtp);
-
 	/*
 	 * Nothing to do if a probe name is specified and cannot match 'entry'
 	 * or 'return'.
@@ -120,8 +128,11 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	if (prb == 0)
 		return 0;
 
-	/* Synthetic function names are not supported for FBT. */
-	if (strchr(pdp->fun, '.'))
+	/*
+	 * Unless we are dealing with a rawfbt probe, synthetic functions are
+	 * not supported.
+	 */
+	if (strcmp(pdp->prv, dt_rawfbt.name) != 0 && strchr(pdp->fun, '.'))
 		return 0;
 
 	/*
@@ -134,6 +145,14 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 			return 0;
 	}
 
+	/*
+	 * Ensure that kernel symbols that are FBT-traceable are marked as
+	 * such.  We don't do this earlier in this function so that the
+	 * preceding tests have the greatest opportunity to avoid doing this
+	 * unnecessarily.
+	 */
+	dt_modsym_mark_traceable(dtp);
+
 	/*
 	 * If we have an explicit function name, we start with a basic symbol
 	 * name lookup.
@@ -396,12 +415,12 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 \*******************************/
 
 /*
- * Generate a BPF trampoline for a FBT probe.
+ * Generate a BPF trampoline for a FBT (or rawfbt) probe.
  *
  * The trampoline function is called when a FBT probe triggers, and it must
  * satisfy the following prototype:
  *
- *	int dt_fbt(dt_pt_regs *regs)
+ *	int dt_(raw)fbt(dt_pt_regs *regs)
  *
  * The trampoline will populate a dt_dctx_t struct and then call the function
  * that implements the compiled D clause.  It returns 0 to the caller.
@@ -422,7 +441,7 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		dt_cg_tramp_copy_rval_from_regs(pcb);
 
 		/*
-		 * fbt:::return arg0 should be the function offset for
+		 * (raw)fbt:::return arg0 should be the function offset for
 		 * return instruction.  Since we use kretprobes, however,
 		 * which do not fire until the function has returned to
 		 * its caller, information about the returning instruction
@@ -441,11 +460,28 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
+	const char	*fun = prp->desc->fun;
+	char		*tpn = (char *)fun;
+	int		rc = -1;
+
 	if (!dt_tp_probe_has_info(prp)) {
 		char	*fn;
 		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		int	fd;
+
+		/*
+		 * For rawfbt probes, we need to apply a . -> _ conversion to
+		 * ensure the tracepoint name is valid.
+		 */
+		if (strcmp(prp->desc->prv, dt_rawfbt.name) == 0) {
+			char	*p;
+
+			tpn = strdup(fun);
+			for (p = tpn; *p; p++) {
+				if (*p == '.')
+					*p = '_';
+			}
+		}
 
 		/*
 		 * Register the kprobe with the tracing subsystem.  This will
@@ -453,41 +489,42 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		 */
 		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
 		if (fd == -1)
-			return -ENOENT;
+			goto out;
 
 		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
 			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, prp->desc->fun, prp->desc->fun);
+			     FBT_GROUP_DATA, tpn, fun);
 		close(fd);
 		if (rc == -1)
-			return -ENOENT;
+			goto out;
 
 		/* create format file name */
-		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
-			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
-		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
-			return -ENOENT;
-
-		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			 FBT_GROUP_DATA, prp->desc->fun);
+		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
+			     FBT_GROUP_DATA, tpn) == -1)
+			goto out;
 
 		/* open format file */
 		f = fopen(fn, "r");
-		dt_free(dtp, fn);
+		free(fn);
 		if (f == NULL)
-			return -ENOENT;
+			goto out;
 
 		/* read event id from format file */
 		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
 		fclose(f);
 
 		if (rc < 0)
-			return -ENOENT;
+			goto out;
 	}
 
 	/* attach BPF program to the probe */
-	return dt_tp_probe_attach(dtp, prp, bpf_fd);
+	rc = dt_tp_probe_attach(dtp, prp, bpf_fd);
+
+out:
+	if (tpn != prp->desc->fun)
+		free(tpn);
+
+	return rc == -1 ? -ENOENT : rc;
 }
 
 /*
@@ -503,7 +540,8 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
  */
 static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 {
-	int		fd;
+	int	fd;
+	char	*tpn = (char *)prp->desc->fun;
 
 	if (!dt_tp_probe_has_info(prp))
 		return;
@@ -514,9 +552,20 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 	if (fd == -1)
 		return;
 
-	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
-		prp->desc->fun);
+	if (strcmp(prp->desc->prv, dt_rawfbt.name) == 0) {
+		char	*p;
+
+		for (p = tpn; *p; p++) {
+			if (*p == '.')
+				*p = '_';
+		}
+	}
+
+	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, tpn);
 	close(fd);
+
+	if (tpn != prp->desc->fun)
+		free(tpn);
 }
 
 dt_provimpl_t	dt_fbt_fprobe = {
@@ -549,3 +598,15 @@ dt_provimpl_t	dt_fbt = {
 	.name		= prvname,
 	.populate	= &populate,
 };
+
+dt_provimpl_t	dt_rawfbt = {
+	.name		= "rawfbt",
+	.prog_type	= BPF_PROG_TYPE_KPROBE,
+	.populate	= &populate,
+	.provide	= &provide,
+	.load_prog	= &dt_bpf_prog_load,
+	.trampoline	= &kprobe_trampoline,
+	.attach		= &kprobe_attach,
+	.detach		= &kprobe_detach,
+	.probe_destroy	= &dt_tp_probe_destroy,
+};
diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
deleted file mode 100644
index 52152655..00000000
--- a/libdtrace/dt_prov_rawfbt.c
+++ /dev/null
@@ -1,393 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- *
- * The Raw Function Boundary Tracing provider for DTrace.
- *
- * The kernel provides kprobes to trace specific symbols.  They are listed in
- * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
- * a symbol in the core kernel or with a symbol in a specific kernel module.
- * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
- * provider also provides access to synthetic symbols, i.e. symbols created by
- * compiler optimizations.
- *
- * Mapping from event name to DTrace probe name:
- *
- *	<name>					rawfbt:vmlinux:<name>:entry
- *						rawfbt:vmlinux:<name>:return
- *   or
- *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
- *						rawfbt:<modname>:<name>:return
- */
-#include <assert.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include <linux/bpf.h>
-#include <linux/btf.h>
-#include <sys/stat.h>
-#include <sys/types.h>
-
-#include <bpf_asm.h>
-
-#include "dt_btf.h"
-#include "dt_dctx.h"
-#include "dt_cg.h"
-#include "dt_module.h"
-#include "dt_provider_tp.h"
-#include "dt_probe.h"
-#include "dt_pt_regs.h"
-
-static const char		prvname[] = "rawfbt";
-
-#define KPROBE_EVENTS		TRACEFS "kprobe_events"
-
-#define FBT_GROUP_FMT		GROUP_FMT "_%s"
-#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
-
-static const dtrace_pattr_t	pattr = {
-{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
-{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
-{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
-{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
-{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
-};
-
-/*
- * Create the rawfbt provider.
- */
-static int populate(dtrace_hdl_t *dtp)
-{
-	dt_provider_t		*prv;
-
-	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
-	if (prv == NULL)
-		return -1;			/* errno already set */
-
-	return 0;
-}
-
-/* Create a probe (if it does not exist yet). */
-static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
-{
-	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
-
-	if (prv == NULL)
-		return 0;
-	if (dt_probe_lookup(dtp, pdp) != NULL)
-		return 0;
-#ifdef DEBUG_FBT
-	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb)) {
-		fprintf(stderr, "%s(..., PROVIDE %s:%s:%s:%s) - ...\n", __func__, pdp->prv, pdp->mod, pdp->fun, pdp->prb);
-		return 1;
-	}
-#else
-	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
-		return 1;
-#endif
-
-	return 0;
-}
-
-/*
- * Try to provide probes for the given probe description.  The caller ensures
- * that the provider name in probe desxcription (if any) is a match for this
- * provider.  When this is called, we already know that this provider matches
- * the provider component of the probe specification.
- */
-#define FBT_ENTRY	1
-#define FBT_RETURN	2
-
-static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
-{
-	int			n = 0;
-	int			prb = 0;
-	dt_module_t		*dmp = NULL;
-	dt_symbol_t		*sym = NULL;
-	dt_htab_next_t		*it = NULL;
-	dtrace_probedesc_t	pd;
-
-	dt_modsym_mark_traceable(dtp);
-
-	/*
-	 * Nothing to do if a probe name is specified and cannot match 'entry'
-	 * or 'return'.
-	 */
-	if (dt_gmatch("entry", pdp->prb))
-		prb |= FBT_ENTRY;
-	if (dt_gmatch("return", pdp->prb))
-		prb |= FBT_RETURN;
-	if (prb == 0)
-		return 0;
-
-	/*
-	 * If we have an explicit module name, check it.  If not found, we can
-	 * ignore this request.
-	 */
-	if (pdp->mod[0] != '\0' && strchr(pdp->mod, '*') == NULL) {
-		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
-		if (dmp == NULL)
-			return 0;
-	}
-
-	/*
-	 * If we have an explicit function name, we start with a basic symbol
-	 * name lookup.
-	 */
-	if (pdp->fun[0] != '\0' && strchr(pdp->fun, '*') == NULL) {
-		/* If we have a module, use it. */
-		if (dmp != NULL) {
-			sym = dt_module_symbol_by_name(dtp, dmp, pdp->fun);
-			if (sym == NULL)
-				return 0;
-			if (!dt_symbol_traceable(sym))
-				return 0;
-
-			pd.id = DTRACE_IDNONE;
-			pd.prv = pdp->prv;
-			pd.mod = dmp->dm_name;
-			pd.fun = pdp->fun;
-
-			if (prb & FBT_ENTRY) {
-				pd.prb = "entry";
-				n += provide_probe(dtp, &pd);
-			}
-			if (prb & FBT_RETURN) {
-				pd.prb = "return";
-				n += provide_probe(dtp, &pd);
-			}
-
-			return n;
-		}
-
-		sym = dt_symbol_by_name(dtp, pdp->fun);
-		while (sym != NULL) {
-			const char	*mod = dt_symbol_module(sym)->dm_name;
-
-			if (dt_symbol_traceable(sym) &&
-			    dt_gmatch(mod, pdp->mod)) {
-				pd.id = DTRACE_IDNONE;
-				pd.prv = pdp->prv;
-				pd.mod = mod;
-				pd.fun = pdp->fun;
-
-				if (prb & FBT_ENTRY) {
-					pd.prb = "entry";
-					n += provide_probe(dtp, &pd);
-				}
-				if (prb & FBT_RETURN) {
-					pd.prb = "return";
-					n += provide_probe(dtp, &pd);
-				}
-
-			}
-			sym = dt_symbol_by_name_next(sym);
-		}
-
-		return n;
-	}
-
-	/*
-	 * No explicit function name.  We need to go through all possible
-	 * symbol names and see if they match.
-	 */
-	while ((sym = dt_htab_next(dtp->dt_kernsyms, &it)) != NULL) {
-		dt_module_t	*smp;
-		const char	*fun;
-
-		/* Ensure the symbol can be traced. */
-		if (!dt_symbol_traceable(sym))
-			continue;
-
-		/* Match the function name. */
-		fun = dt_symbol_name(sym);
-		if (!dt_gmatch(fun, pdp->fun))
-			continue;
-
-		/* Validate the module name. */
-		smp = dt_symbol_module(sym);
-		if (dmp) {
-			if (smp != dmp)
-				continue;
-		} else if (!dt_gmatch(smp->dm_name, pdp->mod))
-			continue;
-
-		pd.id = DTRACE_IDNONE;
-		pd.prv = pdp->prv;
-		pd.mod = smp->dm_name;
-		pd.fun = fun;
-
-		if (prb & FBT_ENTRY) {
-			pd.prb = "entry";
-			n += provide_probe(dtp, &pd);
-		}
-		if (prb & FBT_RETURN) {
-			pd.prb = "return";
-			n += provide_probe(dtp, &pd);
-		}
-	}
-
-	return n;
-}
-
-/*
- * Generate a BPF trampoline for a FBT probe.
- *
- * The trampoline function is called when a FBT probe triggers, and it must
- * satisfy the following prototype:
- *
- *	int dt_rawfbt(dt_pt_regs *regs)
- *
- * The trampoline will populate a dt_dctx_t struct and then call the function
- * that implements the compiled D clause.  It returns 0 to the caller.
- */
-static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
-{
-	dt_cg_tramp_prologue(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-	dt_cg_tramp_copy_regs(pcb);
-	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
-		dt_irlist_t	*dlp = &pcb->pcb_ir;
-
-		dt_cg_tramp_copy_rval_from_regs(pcb);
-
-		/*
-		 * fbt:::return arg0 should be the function offset for
-		 * return instruction.  Since we use kretprobes, however,
-		 * which do not fire until the function has returned to
-		 * its caller, information about the returning instruction
-		 * in the callee has been lost.
-		 *
-		 * Set arg0=-1 to indicate that we do not know the value.
-		 */
-		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
-		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
-	} else
-		dt_cg_tramp_copy_args_from_regs(pcb, 1);
-	dt_cg_tramp_epilogue(pcb);
-
-	return 0;
-}
-
-static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
-{
-	char	*prb = NULL;
-
-	if (!dt_tp_probe_has_info(prp)) {
-		char	*fn, *p;
-		FILE	*f;
-		int	fd, rc = -1;
-
-		/*
-		 * The tracepoint event we will be creating needs to have a
-		 * valid name.  We use a copy of the probe name, with . -> _
-		 * conversion.
-		 */
-		prb = strdup(prp->desc->fun);
-		for (p = prb; *p; p++) {
-			if (*p == '.')
-				*p = '_';
-		}
-
-		/*
-		 * Register the kprobe with the tracing subsystem.  This will
-		 * create a tracepoint event.
-		 */
-		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
-		if (fd == -1)
-			goto fail;
-
-		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
-			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
-			     FBT_GROUP_DATA, prb, prp->desc->fun);
-		close(fd);
-		if (rc == -1)
-			goto fail;
-
-		/* create format file name */
-		if (asprintf(&fn, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			     FBT_GROUP_DATA, prb) == -1)
-			goto fail;
-
-		/* open format file */
-		f = fopen(fn, "r");
-		free(fn);
-		if (f == NULL)
-			goto fail;
-
-		/* read event id from format file */
-		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
-		fclose(f);
-
-		if (rc < 0)
-			goto fail;
-
-		free(prb);
-	}
-
-	/* attach BPF program to the probe */
-	return dt_tp_probe_attach(dtp, prp, bpf_fd);
-
-fail:
-	free(prb);
-	return -ENOENT;
-}
-
-/*
- * Try to clean up system resources that may have been allocated for this
- * probe.
- *
- * If there is an event FD, we close it.
- *
- * We also try to remove any kprobe that may have been created for the probe.
- * This is harmless for probes that didn't get created.  If the removal fails
- * for some reason we are out of luck - fortunately it is not harmful to the
- * system as a whole.
- */
-static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
-{
-	int	fd;
-	char	*prb, *p;
-
-	if (!dt_tp_probe_has_info(prp))
-		return;
-
-	dt_tp_probe_detach(dtp, prp);
-
-	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
-	if (fd == -1)
-		return;
-
-	/* The tracepoint event is the probe nam, with . -> _ conversion. */
-	prb = strdup(prp->desc->fun);
-	for (p = prb; *p; p++) {
-		if (*p == '.')
-			*p = '_';
-	}
-
-	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA, prb);
-	free(prb);
-	close(fd);
-}
-
-dt_provimpl_t	dt_rawfbt = {
-	.name		= prvname,
-	.prog_type	= BPF_PROG_TYPE_KPROBE,
-	.populate	= &populate,
-	.provide	= &provide,
-	.load_prog	= &dt_bpf_prog_load,
-	.trampoline	= &trampoline,
-	.attach		= &attach,
-	.detach		= &detach,
-	.probe_destroy	= &dt_tp_probe_destroy,
-};
-- 
2.45.2

