Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A357163
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 00:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765190; cv=fail; b=jvwcM01NHOMmMlSlehBKv20gfc7sdJMKfqRMjVcDgxMjEWm6kYky9TiIJOv7kEoESTRGw4ggJmpfgtr3+IJMLxFeob9fddEj0J1oVXMihuaFgd0z6E8uHeftigddXXlKWngM2u6lPy/FsFmRNOCB8ivaD16+P+UTEG0ODKiAHlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765190; c=relaxed/simple;
	bh=UNl9oX0+fmCHXq1+Doa9KAeY9w+892oQTlM/KLfFEJk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lv/tA+jABwshHs+Qn/ZPgnx6npM3DHQXB1PPoQyb1x5iX2VUHxSEK9HCbSmZbxMZekJ8rfWL9ySajlR/E11Vl/b3pQ3olOHUGivh/KYKdE/x1TD+DYHST+lCgxZ1vpW750FYrWvtCrlnm4r9mN9HoYLrCTjjAfNlDAREAb8acnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VSjSZGj7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EueVpmKL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VSjSZGj7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EueVpmKL"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Lh1hu028134
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=h0Lv65gFBRYbMWCfJ9Nq6IQs8qFcFm/4b4DriDDishQ=; b=
	VSjSZGj7KO8137K5E1GyKzx7lOthlhGvul431riIJ0e2TUp9Pp1KcZKwPN2dZwnA
	1nyM2pR7ZeWhyDQbA0J+iKplGJ0e6s6yzgdQUe+rO4UdCTiRRyLlKV2Mpw1nacth
	3DjxXXbuiZQBqKz4UyEFG8RWBn0hOBZSjxx7pQlUFR0QPxxzAxpkJ0ZQ5suH5sUJ
	beZfRDfuWudlCknB24T4tzyar0VIvpBikm7mu3k2apDQ63KGWOyh6WBBHU4ytVw2
	f7nLk9gYPTbQmHir/7CZ6u0S5tS4IyyH8LBcJx305JwDhh+lMtxjd1perORKHezG
	2YZXinDVfrGt6cCwb4ubEQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nav245fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4MVwaC009833
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:26 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahcrhne-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XxWmPGQld+nM+rxDeKmZ8cIWS4ZEtTUX4dO82pQuRAKUmlZb+0t7A1fsFc4mfQ7Igwk/Qesv+fAqduKIBIfAcyDSGIT9ldQ9bqZG+BesRfOiQ78sE2yLmhkXzTLCdb17gs1biXUeMk+QJ/9//1OxdCuZIL5x1N4vELGEgIBrpVuXR4Xw3ZzAEePi6oYVUFmqNdETCIQORIgmvy8a1apxD8ran2pB+Vq72au3hImfXQErXBpqHrACon/tg6lfPAKwFNXyEMgNrTHpJOa7U4hhq3y8iejjDbdOoLvNEJ1eXRVMiAcsa5flHpWq3UVwSscFfRIq+KMSceFfMdcI3SrOQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0Lv65gFBRYbMWCfJ9Nq6IQs8qFcFm/4b4DriDDishQ=;
 b=n9pq8Fo3JcCQh9Qm7hKFMNi00Jd0W4FziMEDFUQ/uP8q7kzLJE72C7ikk0VFXWVIXsSWOX7yKEwHY7D9DdZuALddcwvXamRtE97cKzm4VGvftP5QrAgGbluX1ZEWf3iMyxvvJ3NSlWctYE/MGxn/nKxMuo2nrZWSmcgeiiAybHdM62x3BoDElJaMBDF3CqNu/mrkk9rx/DpM7HUMCwNllXftkoarPLqflqzXbuSZYtPn9/e3v/+5Ewn0zPa0Q4xz9qfp7VRAKZuvVqlABW2jsYpJHkcu3NRZgMn5yiHKF/jNDC4f+5i1BluXg6a0bZJhYwgsl948jp9I/2RJBwTWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0Lv65gFBRYbMWCfJ9Nq6IQs8qFcFm/4b4DriDDishQ=;
 b=EueVpmKLUkDU4Bh39mftGNDJirrNHWGLk4lfQZH/OgTCnHuoBGgaYzg6FhmP8lVicb51XPRHvM8R2yXEUhtzep6KF9Ndk15gddrIVfojw+DeD4Kx897uB9NHhqbijUUd8xOQmAFukPHGu2k6pizSJKvsmOVmOQWY6rNDYEwYZ7A=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:06:23 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 00:06:23 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v5 4/6] usdt: typed args and arg mapping
Date: Tue,  5 Nov 2024 00:06:06 +0000
Message-ID: <20241105000608.333229-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105000608.333229-1-nick.alcock@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0388.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::16) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: ec96fc4f-f35e-4e86-5fb7-08dcfd2daeae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JjFp56c2+Ra6pnKixH12MVEoMKEhpeJNkzA2NLZrS+kw223jxHmtyqxKZrOq?=
 =?us-ascii?Q?6P2e+FTswJAV0u0zBXOYD7BEzKoVR3y6K17qgzI6XcFgxBzLMMPx4lrBlFEq?=
 =?us-ascii?Q?STtUqfoThhFXXifkPkOvm1gpt1GSgbNvZVBUo2VAZdr6wxJBCuz0SEqpQw4G?=
 =?us-ascii?Q?ao129DsW/EEVK0h+LjVwAgeHwyi95h/m+LtfzpbG5dKdqwFdbp/GWAEdsvQY?=
 =?us-ascii?Q?9hWUbxrxsEZDLbeFeL6T5mEUUliGwKf+TUHrLznhFoGLRMAknU4jwPO33PZY?=
 =?us-ascii?Q?IiR36V0YAfLU0fRMfR8hOgo/3p9/qjAeD5oYpj99t/z3u0JORAAjA3HzKtuI?=
 =?us-ascii?Q?9MAxtcLMVa2tAH7ry1aeaPyiX0MOWT/e5ok/gwTzNmeLn39/jULUtw+AhznS?=
 =?us-ascii?Q?neHW2oLI2x4eawLwJ+zFeSFJipdOIokH5u368rWLpZz6hI07WAyPBcdtvOxa?=
 =?us-ascii?Q?mjWYbFGGjNXdB0zSlbunAabb64ZIsRZ722/afo6RHAwkBi+fwEe1DK/DwCpn?=
 =?us-ascii?Q?90vjHhgxmLaYNSaQSYJ6d34x4pLDHDv/RdmZXxc5x3SQ4vnHEF9lTBXZvzSb?=
 =?us-ascii?Q?Pfz98oN4YH32txlSUCfqZiBS+TrNqBf91sQsa7LR1miV1Rn9TZTZhIq84QPb?=
 =?us-ascii?Q?D7Ouo59KwlvLTEKoBgP7ydE/POk0u15B5aLxnhPR0ck30XH2s0FGwwmNkMjk?=
 =?us-ascii?Q?8booxaGd+Ci8rTuPAyMVFScmX+/63tKsIXXXTpt3smeBBSojR7O2pjAAM9uz?=
 =?us-ascii?Q?wqk1o6lrVlBgHRMOTXBUMPMwVP7Xlcgq7rqY3DewGGp1ciYElMAp65Qn7ZBj?=
 =?us-ascii?Q?bdi6yy7XUP84ju6u9V7DsIAfZgRDw0hwCgOBUqppzexoo26PHCPR8Vx+cKCV?=
 =?us-ascii?Q?4IX77yJq43Z1iV5Mh/ZpTLfIJXZN2KVmipsBKKOi9we/31EniF2CihtvMtNR?=
 =?us-ascii?Q?w00OMFRaxcI7u/KV7HKBFPpjEXjw5v5VRiUODfl8zRckXWWCF4QueCqvR4nw?=
 =?us-ascii?Q?mcBYYxlf75RxZI7S+qpsrThSJ/ozKLPSJrUjImfdzhPqg73h1Kxl+wYfMdVK?=
 =?us-ascii?Q?EwNESUimGWeuBKL5eY8rhP0VBoL1995rO9LirCHWLd0xxvYX1a2hJAl/v3zG?=
 =?us-ascii?Q?VcRbXfINlFc36Z7Vzz6aNKY7+vj2mVS9QrtYX560JNa8vbcZDSGBJQbdmMVr?=
 =?us-ascii?Q?uhePyiYOGMy5mBsKKcpMFXD9sR94WZR1ic7Rc8ubWZ9wBkpj0bSpo1KhYA2c?=
 =?us-ascii?Q?f2CKwhAMZ/VIDaQ9qimOjzOV8QNsucpiIwyl4nRcmpOR1fAeM3OPxis9+MeO?=
 =?us-ascii?Q?rWAxP68U0mWqC8ga7zR2ybeC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r4mQSb5RgrErDTwC6pUJxaJEEi0b/8ZpPVdxxNDqlow92RNpDxso+8ZEhqp7?=
 =?us-ascii?Q?8GbcjK9hc3KPXaHiSkHZgJ1+mhClEwrVr6YxMjRtgJD9XOOX3UUZeQ+jkWOF?=
 =?us-ascii?Q?LQ1YBwx+rlR0AFoIierslSliS0JWbtj6eACa7spKTpsYSrvt+QxB7qYZ9i0E?=
 =?us-ascii?Q?PN9wuxVD0AvTk/yrB9jj8djLNLWHCf0S7vA26PSFB+5HEhwepZ2yX/fdjbM2?=
 =?us-ascii?Q?n4YHRbf2H9PgWl3E5afKP3xk3nIHynErcS12lNQOxOONE21ZHGczLzt3UpsH?=
 =?us-ascii?Q?ewdjwH1hmxJxLZdWF9obUa8SWO/vmAlgi7mw96ofqUChbUvdAFS0ZHdBtumc?=
 =?us-ascii?Q?3gsNYOrRM33BbqIZDH2eY6FyuIYAse3J42Ad8XRsZDjPpqMkHAatFhrTrjb4?=
 =?us-ascii?Q?dvw4rmaGtSs1jTJ2Z3O15SFhKDrkUwz++fu9lHVW6QxrqrzT4UGc3YR01KTi?=
 =?us-ascii?Q?gMe9IPbuXRx64e3ix3hirokdaAyPggc9lETjzz/ObDCYZtiTFPenB30d87eZ?=
 =?us-ascii?Q?bYgREb4EyYVRzpZFPx7M6RX7Md+0DxO+p1S4EsqvsdSwBtzC1XqkoVGMERGP?=
 =?us-ascii?Q?y2nDlo1DrQJlJgs/udb5q2729cjGlHMcOe3evaGiuMtVIFwr/wylhK3dcIas?=
 =?us-ascii?Q?fnfl5bp3MZWZ+sOpXODfiGxbg2MlH4jXZcK5bl5gAgAKu4sCQTaSgs0UK7lB?=
 =?us-ascii?Q?5FOTMY527C0Wh+qhzmv79y+GvkkJhNnbMXt6GV0vs0AjYzc9+QNcch4CxLbw?=
 =?us-ascii?Q?NRSVmz3RuAOCMK1Fm+FFvQbvkoanHrpI0+L4/9CLc1t04L2jVQnhuHYyN60M?=
 =?us-ascii?Q?xxwudmw7VvAR0piJ5c99XcFKx5ErKBM7H0jSxsWTjUHx/v57+G8Ln8m9GexW?=
 =?us-ascii?Q?po1TTCTxqmJDY5no3fo/EG7tOrMn0uFs3yNbizPQxRlUfN6C4J95INmbmMRd?=
 =?us-ascii?Q?Xp+uXzEtSUdUGObUG5GmNToA4yuF7HSe+OOMlX1X5hAjibdp8jfbpfBaWi3G?=
 =?us-ascii?Q?6EM0O9E7pdK6mi25b6tLdFVgnzTlYWa0NjUtX699UDrMdJCz4l3xGccYjogx?=
 =?us-ascii?Q?1Bz8FBKkDCV4NKDBVxAUqxejutE+yilwrmc7L6D4+zxzZ0Ge2ZRtS1Dzan81?=
 =?us-ascii?Q?pdulIl2FdjhUvK+WoOL6aSvQIJ/A7IrQgSgChzdKu/Gb3P4K8uQ18aq8POxj?=
 =?us-ascii?Q?Rj0jVbWH9EWldAaDpWRKx8vYYwpcah87Xkbm4mHGvBCCyCSnIZ5CwbfLKRGs?=
 =?us-ascii?Q?QqwjOKnB8HM7HPwOVbU8Lx912zyo5u134JPsSoV8WJdzeO7+sGPja0wjcPJl?=
 =?us-ascii?Q?fwyLZemV4EGtOO3I+qSUciKK8KidsvO3CFkjxHLar7INJJlhGTMlN3r7/l5f?=
 =?us-ascii?Q?DHyUJHwu2lUGVlcsa1KiQM+OItVWC3ICWytbjYp67nWAItB9sHKy/EPKixf4?=
 =?us-ascii?Q?/AP9tc5FnvqDs7S6FesQm7S4SdfoYHRRWD/Qg0NaVAAlwFyVBeXwKTGdLJP8?=
 =?us-ascii?Q?tHd8NuZ1wr1GNkAVfwTd06WHYykpLNZlxNCP0vDEmgfAXlYNvjtmxQp4OW+q?=
 =?us-ascii?Q?l/6+0C17B8B3gXcVYY8jRcIVNeMbu4Q0lN7atPRZQJdcDRdKrAxnUQHDabD0?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q9YgY5Tyga0K9Jc2XL6eRAoDJYskwqz/Z2qPvFL9I+MV+RNeIzAvUmI9VSuXL7vrP/HUsQ/7AsFauwb3IhVvGVF7F37vIx8wg5hSacSz1W1uomcDfexDq0UNRffdOmncXVElURx98wK7tKxw+FBx094Y8G1h7mwuLUdbUGMezTY4y7baH4wM2THOswhGvqz4KMhP3Q2TZZaGE1zT3p/JQ7m3DNKKWR6JfCgB5wA/YNM/oTWYszVhtkf8lZiLi9DYzoljVciuXqedC/FRLUY96ACY3nB4miDXwSPH39ZAm1HZ+ZM/yUPB+oq82S/OO0j2VIWSEfEES0N0Uy/Voxc4VYB8Ecx221dL+TA7OeuSfF8vEM/DifM8PffSwwiY7BuBOiJuglA9iCQJGNjHXR1EF8bJDIDi4Bu6+o1VDzCQvLASVSBNxL32q+dAlOs+SUAKRsUtwKnj3VsoA8LrgEqlpf6Osow95CRy9KBrLi2gDjZq4HZ+r5jaH1tsceWVCGebdat3ScvKMsC1bJm+buwMst4kkLR8pvoQTeBIGgImm+tGP29No0d/ME3363OaQV8J6TKWYwOyKBBZ6zWPzyly9vTy4/ethUyLZlzSB9TkhKI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec96fc4f-f35e-4e86-5fb7-08dcfd2daeae
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:06:22.7398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHAN6BfkxqfDEnS69XHNrkOsZfRMisAkDGSZxi3nSU1AB8N1W8EpzCWdnsxfeZ1hjM/rfXgs4RWkPRgALyY5Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_21,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411040192
X-Proofpoint-GUID: nxvJRpPmkWgHR8TOdqWQLZAH9NSXP0RJ
X-Proofpoint-ORIG-GUID: nxvJRpPmkWgHR8TOdqWQLZAH9NSXP0RJ

This change propagates the arg type and mapping info we just got into the
pid_probespec_t onward into the underlying dt_uprobe_t, shuffles the native
types before handing off a 1:1 mapping to the dt_probe_t, and calls
dt_cg_tramp_map_args() to apply the requested mappings.  With this, USDT
probes should now have visible types which obey the :-notation translators
specified in their .d fils (this is now tested).

The probe info has been moved from the underlying probe to the overlying one
as part of this: underlying probes don't have any user-visible args to
get info for, and their probe_info functions are never called.  We do all
the arg reshuffling in a function ultimately called from USDT probe
discovery via provide_underlying, so it predates trampoline setup let alone
probe_info on the overlying probe and all the args info is present before
it is needed.  (We intentionally do not shuffle the args in
dt_cg_tramp_map_args specifically so that we are not sensitive to the
relative call order of trampoline() versus probe_info(), but there's no
escaping the requirement for USDT probe discovery to predate all of this:
but this was already a requirement in any case.)

We make one assumption for simplicity, noted by a TODO in the source.
We assume that overlying probes all have the same native types and mappings,
so we don't need to look at more than one underlying probe to figure out what
they are.  DTrace always generates such a thing, but DOF specifying multiple
overlapping probes seems perfectly possible for other programs to generate.
This should probably be validated in dof_parser.c in future.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 include/dtrace/pid.h                          |   1 +
 libdtrace/dt_pid.c                            |   3 +-
 libdtrace/dt_prov_uprobe.c                    | 185 ++++++++++++++++--
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 ++++++++
 test/unittest/usdt/err.argmap-null.d          |  41 ++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 +++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
 test/unittest/usdt/tst.argmap.d               |   5 +-
 15 files changed, 478 insertions(+), 19 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 25bfacfdbfe2..c53e600475df 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -22,6 +22,7 @@ typedef enum pid_probetype {
 	DTPPT_ENTRY,
 	DTPPT_RETURN,
 	DTPPT_OFFSETS,
+	DTPPT_USDT,
 	DTPPT_IS_ENABLED
 } pid_probetype_t;
 
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 71ac1754d343..a0b3d892fd23 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -950,6 +950,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 
 			p += args->size;
 			seen_size += args->size;
+			args = (dof_parsed_t *) p;
 
 			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
 						 dof_buf_size, seen_size))
@@ -1000,7 +1001,7 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 				goto oom;
 			}
 
-			psp.pps_type = tp->tracepoint.is_enabled ? DTPPT_IS_ENABLED : DTPPT_OFFSETS;
+			psp.pps_type = tp->tracepoint.is_enabled ? DTPPT_IS_ENABLED : DTPPT_USDT;
 			psp.pps_prv = prv;
 			psp.pps_mod = mod;
 			psp.pps_fun = fun;
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index a8c1ab2761f0..28f5351be21a 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -46,9 +46,11 @@
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
 
-#define PP_IS_RETURN	1
-#define PP_IS_FUNCALL	2
-#define PP_IS_ENABLED	4
+#define PP_IS_RETURN	0x1
+#define PP_IS_FUNCALL	0x2
+#define PP_IS_ENABLED	0x4
+#define PP_IS_USDT	0x8
+#define PP_IS_MAPPED	0x10
 
 typedef struct dt_uprobe {
 	dev_t		dev;
@@ -57,7 +59,10 @@ typedef struct dt_uprobe {
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	dt_list_t	probes;		/* pid/USDT probes triggered by it */
+	int		argc;		   /* number of args */
+	dt_argdesc_t	*args;		   /* args array (points into argvbuf) */
+	char		*argvbuf;	   /* arg strtab */
+	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -123,6 +128,8 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->args);
+	dt_free(dtp, upp->argvbuf);
 	dt_free(dtp, upp);
 }
 
@@ -516,6 +523,83 @@ static int discover(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Populate args for an underlying probe.  This really relates to an overlying
+ * USDT probe (all overlying probes associated with a given underlying probe
+ * must have the same args), but the overlying probe doesn't exist at the point
+ * this is populated, so we must put it in the underlying probe instead and pull
+ * it out when the overlying probe info is called for.
+ *
+ * Move it into dt_argdesc_t's for use later on. The char *'s in that structure
+ * are pointers into the argvbuf array, which is a straight concatenated copy of
+ * the nargc/xargc in the pid_probespec_t.
+ */
+static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
+			 dt_uprobe_t *upp)
+{
+	char	**nargv = NULL;
+	char	*nptr = NULL, *xptr = NULL;
+	size_t	i;
+
+	upp->argc = psp->pps_xargc;
+
+	/*
+	 * If we have a nonzero number of args, we always have at least one narg
+	 * and at least one xarg.  Double-check to be sure.  (These are not
+	 * populated, and thus left 0/NULL, for non-USDT probes.)
+	 */
+	if (upp->argc == 0 || psp->pps_xargv == NULL || psp->pps_nargv == NULL
+		|| psp->pps_xargvlen == 0 || psp->pps_nargvlen == 0)
+		return 0;
+
+	upp->argvbuf = dt_alloc(dtp, psp->pps_xargvlen + psp->pps_nargvlen);
+	if(upp->argvbuf == NULL)
+		return -1;
+	memcpy(upp->argvbuf, psp->pps_xargv, psp->pps_xargvlen);
+	xptr = upp->argvbuf;
+
+	memcpy(upp->argvbuf + psp->pps_xargvlen, psp->pps_nargv, psp->pps_nargvlen);
+	nptr = upp->argvbuf + psp->pps_xargvlen;
+
+	upp->args = dt_calloc(dtp, upp->argc, sizeof(dt_argdesc_t));
+	if (upp->args == NULL)
+		return -1;
+
+	/*
+	 * Construct an array to allow accessing native args by index.
+	 */
+
+	if ((nargv = dt_calloc(dtp, psp->pps_nargc, sizeof (char *))) == NULL)
+		goto fail;
+
+	for (i = 0; i < psp->pps_nargc; i++, nptr += strlen(nptr) + 1)
+		nargv[i] = nptr;
+
+        /*
+	 * Fill up the upp->args array based on xargs.  If this indicates that
+	 * mapping is needed, note as much.
+	 */
+
+	for (i = 0; i < upp->argc; i++, xptr += strlen(xptr) + 1) {
+		int map_arg = psp->pps_argmap[i];
+
+		upp->args[i].native = nargv[map_arg];
+		upp->args[i].xlate = xptr;
+		upp->args[i].mapping = map_arg;
+		upp->args[i].flags = 0;
+
+                if (i != map_arg)
+			upp->flags |= PP_IS_MAPPED;
+	}
+
+	free(nargv);
+	return 0;
+
+ fail:
+	free(nargv);
+	return -1;
+}
+
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
  * uprobe.  Since multiple pid and USDT probes may all map onto the same
@@ -530,7 +614,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
-	dt_uprobe_t		*upp;
+	dt_uprobe_t		*upp = NULL;
 
 	/*
 	 * The underlying probes (uprobes) represent the tracepoints that pid
@@ -555,6 +639,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	case DTPPT_ENTRY:
 	case DTPPT_OFFSETS:
+	case DTPPT_USDT:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
 		break;
 	default:
@@ -568,6 +653,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.fun = psp->pps_fun;
 	pd.prb = prb;
 
+	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
+		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
 	uprp = dt_probe_lookup(dtp, &pd);
 	if (uprp == NULL) {
 		dt_provider_t	*pvp;
@@ -591,12 +678,24 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 			goto fail;
 
 		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
-				      upp);
+				       upp);
 		if (uprp == NULL)
 			goto fail;
 	} else
 		upp = uprp->prv_data;
 
+	/*
+	 * Only one USDT probe can correspond to each underlying probe.
+	 */
+	if (psp->pps_type == DTPPT_USDT && upp->flags == PP_IS_USDT) {
+		dt_dprintf("Found overlapping USDT probe at %lx/%lx/%lx/%s\n",
+			   upp->dev, upp->inum, upp->off, upp->fn);
+		goto fail;
+	}
+
+	if (populate_args(dtp, psp, upp) < 0)
+		goto fail;
+
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
 	    upp->flags |= PP_IS_RETURN;
@@ -604,15 +703,19 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	    upp->flags |= PP_IS_ENABLED;
 	    break;
+	case DTPPT_USDT:
+	    upp->flags |= PP_IS_USDT;
+	    break;
 	default: ;
 	    /*
 	     * No flags needed for other types.
 	     */
 	}
-
 	return uprp;
 
 fail:
+	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
+		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
 	probe_destroy(dtp, upp);
 	return NULL;
 }
@@ -732,7 +835,7 @@ static int provide_pid_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 
 static int provide_usdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 {
-	if (psp->pps_type != DTPPT_OFFSETS &&
+	if (psp->pps_type != DTPPT_USDT &&
 	    psp->pps_type != DTPPT_IS_ENABLED) {
 		dt_dprintf("pid: unknown USDT probe type %i\n", psp->pps_type);
 		return -1;
@@ -786,7 +889,12 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  *	int dt_uprobe(dt_pt_regs *regs)
  *
  * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
- * the firing of all dependent pid* probes and their clauses.
+ * the firing of all dependent pid* and USDT probes and their clauses, or (in
+ * the case of is-enabled probes), do the necessary copying (is-enabled probes
+ * have no associated clauses and their behaviour is hardwired).
+ *
+ * Trampolines associated with USDT probes will also arrange for argument
+ * shuffling if the argmap array calls for it.
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
@@ -864,7 +972,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	}
 
 	/*
-	 * USDT
+	 * USDT.
 	 */
 
 	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
@@ -873,6 +981,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 	dt_cg_tramp_copy_args_from_regs(pcb, 0);
 
+	/*
+	 * Apply arg mappings, if needed.
+	 */
+	if (upp->flags & PP_IS_MAPPED) {
+
+		/* dt_cg_tramp_map_args() works from the saved args. */
+		dt_cg_tramp_save_args(pcb);
+		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
+	}
+
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
 	 */
@@ -1083,8 +1201,49 @@ attach_bpf:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	*argcp = 0;			/* no known arguments */
-	*argvp = NULL;
+	size_t		i;
+	list_probe_t	*pup = prp->prv_data;
+	dt_uprobe_t	*upp;
+	size_t		argc = 0;
+	dt_argdesc_t	*argv = NULL;
+
+	/* No underlying probes?  No args.  */
+	if (!pup)
+		goto done;
+
+	upp = pup->probe->prv_data;
+	if (!upp || upp->args == NULL)
+		goto done;
+
+	argc = upp->argc;
+
+	argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
+	if (argv == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
+	for (i = 0; i < argc; i++) {
+		argv[i].native = strdup(upp->args[i].native);
+		if (upp->args[i].xlate)
+			argv[i].xlate = strdup(upp->args[i].xlate);
+		argv[i].mapping = i;
+
+		if (argv[i].native == NULL ||
+		    (upp->args[i].xlate != NULL && argv[i].xlate == NULL)) {
+			size_t j;
+
+			for (j = 0; j <= i; j++) {
+				free((char *) argv[i].native);
+				free((char *) argv[i].xlate);
+			}
+
+			dt_free(dtp, argv);
+			return dt_set_errno(dtp, EDT_NOMEM);
+		}
+	}
+
+done:
+	*argcp = argc;
+	*argvp = argv;
 
 	return 0;
 }
@@ -1152,7 +1311,6 @@ dt_provimpl_t	dt_uprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 	.add_probe	= &add_probe_uprobe,
@@ -1178,6 +1336,7 @@ dt_provimpl_t	dt_usdt = {
 	.populate	= &populate_usdt,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_info	= &probe_info,
 	.probe_destroy	= &probe_destroy,
 	.discover	= &discover,
 	.add_probe	= &add_probe_usdt,
diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
index 28134baa6fa3..d8c3e88c4616 100644
--- a/test/triggers/usdt-tst-argmap-prov.d
+++ b/test/triggers/usdt-tst-argmap-prov.d
@@ -1,10 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 provider test_prov {
 	probe place(int i, int j) : (int j, int i, int i, int j);
+	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
+	probe place3(int i, char *j) : (char *j);
+	probe place4(int i, char *j) : ();
 };
diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
index 89a0a53fc1d5..9244092514ff 100644
--- a/test/triggers/usdt-tst-argmap.c
+++ b/test/triggers/usdt-tst-argmap.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,6 +12,9 @@ main(int argc, char **argv)
 {
 	for (;;) {
 		DTRACE_PROBE2(test_prov, place, 10, 4);
+		DTRACE_PROBE(test_prov, place2, 255, "foo");
+		DTRACE_PROBE(test_prov, place3, 126, "bar");
+		DTRACE_PROBE(test_prov, place4, 204, "baz");
 	}
 
 	return 0;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
new file mode 100644
index 000000000000..8bcfa92ff6b0
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
@@ -0,0 +1,34 @@
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
new file mode 100755
index 000000000000..ad8dc2e7c267
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -0,0 +1,83 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+##
+#
+# ASSERTION:
+# Testing -lvn option with USDT probes with a valid probe name.
+#
+# SECTION: dtrace Utility/-ln Option
+#
+##
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go(int a, char *b) : (char *b, int a);
+};
+EOF
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >& 2
+	exit 1
+fi
+
+cat > test.c <<EOF
+#include <sys/types.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	TEST_PROV_GO(666, "foo");
+	sleep(10);
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${CFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+script()
+{
+	$dtrace -c ./test -lvn 'test_prov$target:::go'
+	./test &
+	PID=$!
+	disown %+
+	$dtrace -p $PID -lvn 'test_prov$target:::go'
+	kill -9 $PID
+}
+
+script
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/err.argmap-null.d b/test/unittest/usdt/err.argmap-null.d
new file mode 100644
index 000000000000..ba765bea7a04
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.d
@@ -0,0 +1,41 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that a probe left with no args at all due to mapping
+ *            has no args.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+/args[0] != 204 || args[0] == 204/
+{
+	printf("this should never happen");
+	exit(1);
+}
+
+test_prov$1:::place4
+{
+	printf("nor should this");
+	exit(1);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
new file mode 100644
index 000000000000..215475e39b48
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/usdt/tst.argmap-null.d b/test/unittest/usdt/tst.argmap-null.d
new file mode 100644
index 000000000000..dacf4c4f569a
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-null.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that you can map to no args at all.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed-partial.d b/test/unittest/usdt/tst.argmap-typed-partial.d
new file mode 100644
index 000000000000..8c4d7273c0ab
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed-partial.d
@@ -0,0 +1,49 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when mapped,
+ *            even if some args are unused.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place3
+/stringof(args[0]) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(args[0]));
+	exit(1);
+}
+
+test_prov$1:::place3
+/stringof(copyinstr(arg0)) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(copyinstr(arg0)));
+	exit(1);
+}
+
+test_prov$1:::place3
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
new file mode 100644
index 000000000000..1243e059b8ae
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when mapped.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place2
+/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(args[0]), args[1], args[2], stringof(args[3]));
+	exit(1);
+}
+
+test_prov$1:::place2
+/stringof(copyinstr(arg0)) != "foo" || arg1 != 255 || arg2 != 255 || stringof(copyinstr(arg3)) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(copyinstr(arg0)), arg1, arg2, stringof(copyinstr(arg3)));
+	exit(1);
+}
+
+test_prov$1:::place2
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
index 7896dc07e0e2..a7d68da3dfbc 100644
--- a/test/unittest/usdt/tst.argmap.d
+++ b/test/unittest/usdt/tst.argmap.d
@@ -1,17 +1,16 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: usdt-tst-argmap */
 /* @@trigger-timing: before */
 /* @@runtest-opts: $_pid */
 
 /*
- * ASSERTION: Verify that argN and args[N] variables are properly remapped.
+ * ASSERTION: Verify that argN and args[N] variables are properly mapped.
  */
 
 BEGIN
-- 
2.46.0.278.g36e3a12567

