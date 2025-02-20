Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF50267384
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 23:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740094062; cv=fail; b=eq5GPM7/U71TMtDJ5+kaZnGHHpff8Id0vyA/ZEyO3Fco0O73iRaLyZIwOT9kPxXweG2gKRb7jOvwSBL1twV6o1iMpkwC6XQDRaJitR6RN5dluabcIJ4rTo+qioJaYcjIK2oSdbe5NpO43+Ju2Mv3AbLLXkxl5arV+2MGW9uMbvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740094062; c=relaxed/simple;
	bh=OTua1mO6QMTQKcsLmCIJmLYpgT4GJkNa/J7UXCRduGI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NOE3673eb0GylnKStkOT3LLHapTr4udwpazPr6VwAxmgxLZqs6rPXu1wBc61eZN75bMifNiugJc+mmAiNYzu7Y0/uY9dqP1K2ZMTZ40WZxHnCL+oAwSF93niiBVCdBLwY/DDj2advkjoQvR1tuilDZLsnFyg/IKu107ze9vtKLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MwqfZDKz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QSIG2Yhr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MwqfZDKz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QSIG2Yhr"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KLrYQE013948
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 23:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=0A0PGDrQucq65ylMaDwEmCkQwmR9CdeWHNsAO23+qEA=; b=
	MwqfZDKz1AOxgwQdfBumuQuovZgbIM+A4UIXuB6nOfGqCZaYu8dkHZYkOEJiuW4E
	5TRtUkC1xZcoXPFms6urbe0obiKMJms6i3WcUKH4MJ5ESeBNndXqKqETMmO98WUa
	ATzapsBL62mFVVl3obafl2WH0xq0M7+1YSkwd8LP5iakYJou257MYX9suTZDKWki
	egn2edE97gsBAbmrm1P2/NuQMx+kqfIRwIHlwM1GJu9ei/3nQFCjEM+e/oaN/SAQ
	9w7mW93Y3jSZ3SKZaAwG+8PjQ4c/iVMeM7qNcupEEXB7OOhb14ewCBQkeAIuoUnS
	OIw18G1KuKWkk06uXEaiDQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w00nnb6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 23:27:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51KN3wL9002207
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 23:27:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w0tnxkqy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Feb 2025 23:27:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeXiG2LppuJ5ld7ul67HNdfKCIQ9scxFZcfGo5mRr5yFLQB0ldDbTnKclE4OamqGDe3a1K5yCsaDJV4N4v9VTLVhK0NfN60NB3xbZU1Pb2GBjbiX2wPMuAaIEKQhwHnIXdmBlowHKN6OrC2B5hl6L+ta/PCuj8KfrKxLbTUi/8HiBPZgoGeTg5wy8XE3fnYtz+OXFObdigVr0ofPXpEg3iv+1vfZJ4IsDRvJYzQ0mnivkCuYWH4CV36V1Yz5z6wFZMmCixgJ8znbbTWICl4hGV6jCSYDU4CMrms0eOLclPeqDTbuwqP7l9rIqKDiWkNx06k1BIdomajrmQvLZgFLPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A0PGDrQucq65ylMaDwEmCkQwmR9CdeWHNsAO23+qEA=;
 b=vFZa/1HfpTSOGrzC4jntEiwBD+NL2VORsW5kDpJVFcOH8VZlGAP1sllwCVc0V+UH2Kluz+uePtbt4BoLtMy/cElUUEavhCsdU1dI+617krA84L/q0cbGhpPFQdvw0o79wgdBwp31hicWbHzh1GtSvyMRGjecyHgbdQTztOB0BLbCY7A2opB7IHRmNGf+oGntPhYBI8lhY3h6taotgqp356Ji5K0M1xhxmG++RAxnTawqAG38fYSyu13oN1mGPRt4Bfqph7oZ5R0fAmEv1Cfbs5TkwMs4QoEMicvvQwDCOYlRPs31IPxF4k25KLdme7K7fiNvANqvev+S+NjFGr1IUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0A0PGDrQucq65ylMaDwEmCkQwmR9CdeWHNsAO23+qEA=;
 b=QSIG2YhrWgYikwbjJh6gK5mT1bYyj4CqvVoeqWBoMq7S3zjfnl2LFeGYDEJAXcMhI97kZND7vtcDq/dXWV4CwXi8baBXLkR49tVAY0Jy1KhhfxGM5jww2Av7QfG3WzwhaPxkN4BRP+7ABQO/XQcav78m4U/Vd8zFPbDaFT5qAA8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB8118.namprd10.prod.outlook.com (2603:10b6:208:4fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Thu, 20 Feb
 2025 23:27:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 23:27:31 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix format specifier in dtprobed.c
Date: Thu, 20 Feb 2025 18:27:30 -0500
Message-Id: <20250220232730.25029-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0032.namprd08.prod.outlook.com
 (2603:10b6:a03:100::45) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: db96a8d2-46e8-4e63-fc0a-08dd520625eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QF55N1MZHTDiBtXEA9fgsLgDOf3WTOGBJ2PmEAsGppHW6DKDgeoMSjx4urxK?=
 =?us-ascii?Q?zGg+NY/bl1xeY54WiBu6z+1wF826ZRWKQTM/iPxOtI369t9QecRyDQfyBpx1?=
 =?us-ascii?Q?gxkq0QrRCe5bPNdD5o1v21AW075LDVFCMJv3wCEdhMAH1xnbllpcWtlGpsmc?=
 =?us-ascii?Q?iDU4C0ouHBlo+iBSCLLmjP538THZ/TWqYohQ/olri1dJUsK3fZx6M2iqAErB?=
 =?us-ascii?Q?5j1YqyinfmpSwVuovYhD4hcjbUO09joiyP4aNqyZqVzx40BIx3uTE2FvvD8F?=
 =?us-ascii?Q?BtxpnvECdF22wkug7uo8/VC6dRaQvdYqJ3hl5hM3KL4aQcwq9SPr0XOohHZB?=
 =?us-ascii?Q?+MzhsRCjWgq1QGQwkDxluGq0c8dBtGwRA672ZoUYtpLF4AN88IIilLRMFGul?=
 =?us-ascii?Q?9+tedZT/EAJu1RpJsaldluHIVC3S8jok+EWXRHZaYmBUuy3Iqi/pBXuar+mL?=
 =?us-ascii?Q?KA1Deq61LhKepVUkUhuSmDhvnvE3w7Jtzose4x9joaqIiE4exlEqtLTzv13O?=
 =?us-ascii?Q?GHBKnYgbqTl+mpp7gwAW1y785hHzyZgTbexneZS8++koAaeQSRwD7rIqsrIA?=
 =?us-ascii?Q?E/jgt7eh9c/UnXjmoDe2Hk4oedosa8x5nCWmk3egRAb5YQ8z+AzKOJF9UF1z?=
 =?us-ascii?Q?NGFWzL3sfiO0kFgwZZ1M+TwlPxAg6GXPm47crpNw1dWfFwORyI4uqEWcHJQY?=
 =?us-ascii?Q?JGe+zDx4AfP1x4OVcXvlxeY0O5vxlYpdzbemopkr8EN/8J2Bfi5x+mgY2vYq?=
 =?us-ascii?Q?tX2+n9ufq2pUY8UZ/3utEETGES2gh3jf33fTq0O5jgdKGcUOoXnMPD7ZCpU1?=
 =?us-ascii?Q?J5OUXPwFzT1SmoSRc4q1ra8uIBsLbthe7bc3C/eYjgsXQJDglLLcA9eW6360?=
 =?us-ascii?Q?uKwRtJrHsx/iQko2keZvz3RDggIw655ED40h8RVUW8YREe6jYAhssJMGaZ1M?=
 =?us-ascii?Q?zXqfMxFJ/ZMCFZki0ycCFShcq3FLTAB7FbAKbEYEXL+uWrMwJQVtDXsQWRpO?=
 =?us-ascii?Q?Do8F9kbdLLf0HrZp/EcSuulbCgbBjg4pL51ZrDvVdyAmSr4LVfNgZGGQLV1J?=
 =?us-ascii?Q?TVRIjhn7xDB1ehpvrqLBb+/Lmu9fR+7UNVrO8g3j3PUZVY2dpqCN+q8skJ4C?=
 =?us-ascii?Q?d8HWOzQfkrYArKGOdJ+HoN+ntT97fMJ7nQ1QH3QdoH1yisINwPl2xuNoVQ7B?=
 =?us-ascii?Q?/35vzdhDOc2KQMx4uhNq0Q8Rhe93CW4aBwXTF27LPPU2dru+04r7LGMd6VuN?=
 =?us-ascii?Q?i1EJn6qT1UtnZW8Obw8DCkKYLYmtj2qxPYzgC4UfTRXwBhKGCBDb7FZAU1kC?=
 =?us-ascii?Q?KJZpeOnZh1U9uYQHIhp0XgJ3IhDt4KhbaYMirAqwsjrpbO5Z32kFn7XMtH2f?=
 =?us-ascii?Q?YEOMRTMmBSmD6FG5jPY9lABvHFxV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PxOWfTDaPrYXE4OuXgRxcn4zovXwrN4tY78VIjX7OoeTicWmmpdpYatKQCpt?=
 =?us-ascii?Q?y+wnlN8ibY1XuQ31itUHeShBeJZw9vtauJiip3CQG1IQuf6qWLzmxF4XtDXY?=
 =?us-ascii?Q?HYieSdNkSK7mpNFbCA8XqZhRS0gUPOe+t9i8C78tNjIPTnc52WPjUA9qQ7bY?=
 =?us-ascii?Q?HupWXi1l49rr15QO568HEM3rMOxJfmYGvfvWkG3aHhpI3tJI9IsmJkQ6amEo?=
 =?us-ascii?Q?WD7eCbhNQplnivJGG/Y6Zt47HgIA5+QJYruKR9kuPcMimxxrV/1xdtxRj7Gd?=
 =?us-ascii?Q?boJULsFklf9y6zLUJGvnf9ZPcsDo3HcVBLyeFEjeiMuzZ9o1gqMHQyqWPUt+?=
 =?us-ascii?Q?YEQBzPTx0672XzTyy9X9GSxHct6WkpJQGnApCgwvuwAgYD06gMtrIsWVDbT+?=
 =?us-ascii?Q?FScBnzT2cdLfYSe9r5rDIewJ7+jLE8oO56YHVhf3KySyDNTWUmHD5qiO7zE1?=
 =?us-ascii?Q?0C0lRp+IK5RHJnWjOscg1bXt+W5xIr6a3ZyBl0lIsneWZi71odEjbfzLEHRj?=
 =?us-ascii?Q?IMgmOsP1hpWIvlqIjXO6VGrbDjcQFvs994gQgwy/ztbvpP37DGe4Kq29ugeh?=
 =?us-ascii?Q?pE0jNC8h3Vzyq0gq5E2VJE1PJInY3jb7VFD+5BB88bxLE7izcY4CSf8Gw4AK?=
 =?us-ascii?Q?dQQppCSjtNpFNYUeNOz+1IspN7zE/w9tJlUVA69bQCx7v0KgaYL/BOnxKdSQ?=
 =?us-ascii?Q?0aGmq5E8F+bswAO+ebkoSIE+R1PHdiiE2y2Dz8redpbU8QWbWPRwHYpcZ/HZ?=
 =?us-ascii?Q?FtTpWhn2Yxa7JAA1q3i2F4pm3aaJpgYMjvZRnxLuzq2v/gsmqyiLFMDIrPyo?=
 =?us-ascii?Q?5iOMHSN0lh60dZ/Cg3EEodKqTwB7jsgzmBg7Z80UxTc3Yko+sZ/fI77rNHdr?=
 =?us-ascii?Q?3cOO4oZDIVdjEfi+FXjwFfFErvy7emPk1nCWpnhby+vcuYH4QFdjq7qZpNBG?=
 =?us-ascii?Q?zkh64xI2l/QaWtF9V8w5A3sYAgcSqqcGkPxmi5ot0Bvou57IdLjAwLn5Qb8N?=
 =?us-ascii?Q?Ct1tB7RlzWSU+aah7c01JuJ3k6c3vzGCOx/lxet3ymYxlNjBCVt7h4+rAzvY?=
 =?us-ascii?Q?6mObFJxSAEejomkEyQsGpmZ5mCG7UnfE7U5gvhmT0bxWWpi7NZVjCoTm/Gih?=
 =?us-ascii?Q?mlzA2rf+VuSfRDulFb7iZPb3XJSbyNP+5h8vJMSQdvG+ysKaXuCzVXPwrP+J?=
 =?us-ascii?Q?6H2AH2XEGufyTV5X4ONjz7kDyYVfGE60LwIxQezixETSPReFBLQlqMq4RPaU?=
 =?us-ascii?Q?sP3AECCa0chKLNyE1dpuYni61LkQuNouAplKXtjmd7IShsv8XTo6/bCJRy2S?=
 =?us-ascii?Q?zjN9BV+ZI9YwyidRhBL3j8v/VW56IA9ufmfoSBCPQ6HbOKPhKwqLgq/s7jW6?=
 =?us-ascii?Q?sBa824wUCX6FS7C78tgF8d3roRo7qVe04A/E0xoZL17XhWx3yYAlkNWrfCLK?=
 =?us-ascii?Q?D/maA2IYWBzwnmJjf0ed4DiiyRFmB5ZgKbm1KdQFKqAqGzJJxtVujBGUkaC4?=
 =?us-ascii?Q?CyKCpv/8VZJCY736TpEDUqR9kKXhsTZ2uy64T1Qvs4DlmU9gp4V26Fuxbvec?=
 =?us-ascii?Q?HX01dY543QSh9Ci3GX8UZKGHExIzOrlMM04NYVpM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4wcFf2tJewTb+DzTvL65BCiYvfBgQhUdzKkE6bSdvo3W36WEQkeoqJZnXmEy/lQ35KsQvZ2th0b/yUmSf6RgaSd/MPXvi67vf2txku1U1agy/AhYPgrUjhK4WP3fZPx9w2BCs9OV5FN6s8BrhtC12MSlDjuZs/2rfHdqGAtF4qIr9WJp+hA/If3WtuRU/obybDcUNg8od/aiS1Pw28yKsiDjg1njNc+AM7QZlv4sFZkBitpnza2qnGdv0+5AbtG49ZpQQnRHDOeuzNjUDQ8tfGTQvCRgoVH2OfSMnuUeaswWNI8hgYZUqRycqz6yDvLl+0kbn63kCUuowT9Ib9wsjdAvh3bt5s+F952FdmRAencdtpalb/wOwTUjm/Y0C2gDIf6/Ei8z6ZH2QdI3XeM0fmy6/kELXFbPbAQa7Y5ktHcrZxOUG3JvIpTb6SMCh3+GFaHWuo4URWZB4o2w5ArmevDwcGVzNZeK2DaapxLJTfreh63v6Tqf6cWXyUdjKIFPUI/wJ6MqMtpEI8lE1jDFIg3P7cSzXloMckrof51Ij6TrCjoDfuI74Pc0AVMYkNyx9EngOftAk/Us82GNE24dXqLPh0UQ4RWiX2dfan/gV+o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db96a8d2-46e8-4e63-fc0a-08dd520625eb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 23:27:31.7854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kkA5kzs7ZXGMBvFocGU2/qjY/wRloOLJcxtYGlxu1o84iiJ6Sx9tdN2KPrEo+hOUtUGNOOerquL8igarahtWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8118
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502200155
X-Proofpoint-GUID: EO7_KN5J838y19dLcHX1_vKlSK9lY-EM
X-Proofpoint-ORIG-GUID: EO7_KN5J838y19dLcHX1_vKlSK9lY-EM

From: Eugene Loh <eugene.loh@oracle.com>

The format specifier is %i but nprobes is size_t.  Some compilers
issue warnings.  Change the format specifier to match the type.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtprobed/dtprobed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 7857b3200..5f260f0a4 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -787,7 +787,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		if (dof_stash_push_parsed(&accum, provider) < 0)
 			goto oom;
 
-		fuse_log(FUSE_LOG_DEBUG, "Parser read: provider %s, %i probes\n",
+		fuse_log(FUSE_LOG_DEBUG, "Parser read: provider %s, %li probes\n",
 			 provider->provider.name, provider->provider.nprobes);
 
 		for (i = 0; i < provider->provider.nprobes; i++) {
-- 
2.43.5

