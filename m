Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6048A1C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466766; cv=fail; b=ACpftu6YLyfcJZJX/nher78cq6/9OFZV3FmoK0a+fPBwfXQ9ZQtFbDnEXUmPjo33REYe2XyGknG068E1geD2QDp2kV9ta5cKXRMbVZWepzCzMhtGU39LxzFw2YFSNINUrepUIvzp9Fk04ssewxtzVa3nnpbkR4tjoEM6UIFLaHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466766; c=relaxed/simple;
	bh=R5R7ItxQlraTRFmzv5NpzcZs31ySrU/9B34tq8sizgA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VQIKNQ6BYSZn53hp2s2orkLT8euubWJiIjfwSwV3xIb55ZhM9QYiKRsSsHbH3Ed2xl9lv9NPjCzdQnC7un1Nx1rZGPIeYvTZNcqe0UVKxGURkmtb8FF9G0kMx7AxRy6vf2+IAQwqAMkjfiAUTCxr9i1ow8CRH59CwOJP8aQkRiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Vj4n3Oj+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YPuuSFGW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vj4n3Oj+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YPuuSFGW"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMlqu030937
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=vEKsF8eyakrjDg
	YA4sKQFP2ic3vsbyZoACFWHag/RHU=; b=Vj4n3Oj+KGC3584FrUf93H/oihikCo
	qOCahtmdj/+z2dbrrJVOInq71VVfSQA5w/6JTaHxXgB4LuD4T4hfxWHP+vYOkS4a
	PBXgnkKC2/t94B/7G4WfEmS4TPu+s/kt3tJDMrBe16q5zE09JaRqsX0Ksoyonzrs
	n2zl179frPdssErBADBs1aWtoDMj8VAlYHrRI4Ez7Xi+Bk5Ifsuq6NfRSssY/Lf2
	HtlYxZfshUQO5/7/1ogOaiTjZm864s58UW4HNp9HrHh2OhYzrixyeZKt+y1R/Fad
	xUIBSnLnrYFIi7iRExiQUd8s+wMOHsz8tAuNJg0NaOacpQft0GW/MDdA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnhb52aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3pEAr023445
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2gf02x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jjkbfap5mfB1hfv8gyNVBclrqq/M+aa2kNBxztyGLphKyVNTq7YHTR7UT9GPdEPobhIPKMJbxv968pFj/XVKwrUBGwA1BIt8ViiiXyDX2VZUytNmuoqJn18MFqDcJ+x9bvZlSmcDbQgUDr5+ADooxOGurG9kI3fVyTpKZSQvNqBr/XBalhqTfI+1LcvfozBA/q0WzLlOMJVSPXvBkpl+UIPL4UkiRa/G4XCVrmgsktzMWCfv4Bpr29To5h4SabaV11CBZE93PIfAxhvuh/FfEXNW38LoXzJbiGHR9ON+Sq+rGhPiUnWPOyVzM+quTGy23vm6OwGVmo/yDIHW7bALwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vEKsF8eyakrjDgYA4sKQFP2ic3vsbyZoACFWHag/RHU=;
 b=JqyLynWppxodyBTjPlTZX7kjOSN5TPygAeQttjXFrY8b1EhkOhb07kNwMVjzv6Ud6A99y9QNaGE88PnFiySAV8j0rv2CY+TchUsq+wMiiZW82kQQUxXyytVw5XCIocxzipmLZjLOlCtdb4aDeaJGcHa84SJOaptNTzZUjArVG+K3gMB6cyc+1gN4pZXJ+9SV2xqvk0nlNmyXEjw3Z8X3W7IcO+PGu1kq6kTxDHZMVV83bJAugnQ40GDlN7fvrz6EW5GazqfK585R9S3AZ0Kp8Wc7TCaA9JVOQ2elFChpnLDCQGYdM8JUjXFVDDpwalQIuVfGGrmqdXNh9/bIDxMbvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vEKsF8eyakrjDgYA4sKQFP2ic3vsbyZoACFWHag/RHU=;
 b=YPuuSFGWig+1aMhtcwHzBo0KEmNDhNjrxUydz6BePPfgNaw6ngUYYd6+iDQcG7wDq0/ttrz54xDsaeBfCnzPrwn38I8i54qhDlcFv3oQbW7623xJIf2qQpq5ctLMWdMjbdo8+zKl5Hc+JpHlolzZfKe6FwgDJiuAHD4syvFJd74=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:20 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 26/38] test: Annotate xfail (chill not implemented yet)
Date: Thu, 27 Jun 2024 01:38:52 -0400
Message-Id: <20240627053904.21996-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0089.namprd05.prod.outlook.com
 (2603:10b6:a03:332::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bee4960-cea8-46e8-21d0-08dc966b7e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kt5DH8Hj/jeOHQhtYYJ33eHvImEUkvTAxJOQFRI2/WW82hGak6/8tFvriL9f?=
 =?us-ascii?Q?7y/57sA2OSe0KLD6TgYT7+13jyjO3pdT809QdY4aGohV2ad9czqYwCMj+CsH?=
 =?us-ascii?Q?AL+aChrDlknlQtFCIacWeKTY6ZkKXwToI/2STyp2tmeFgIN9J0HyVxVMyhLe?=
 =?us-ascii?Q?Ajb3CygFUiYPojPzeB3TqiGPCgAnB1fCG4K3feeLodNSRKyPVMbuQhOWwoqC?=
 =?us-ascii?Q?PDZNGKWskADkiuM4kcsrl+f/KouUPQLb46xLa/QwIybxgHTg+5fl2ZMjp7v8?=
 =?us-ascii?Q?2Ohs7uewPDEGaRsl7qpQWLFJ59P/REBccw/o5OOtHriR2ia+vqRQyjCTS3O9?=
 =?us-ascii?Q?pGu0EkHwNU0bykT1mWcx4fG1MCiuYeS4r1MPDUuWCYUJNF58WMyy1DyWopxe?=
 =?us-ascii?Q?N529xTTh9FakikNrsCdBwwU+Ix8DmrwjVDVH71Yyoyq7h+zJJRg/nloRWcNZ?=
 =?us-ascii?Q?YIHlp8DIgEzZbUyIPM+QQdKwWSHtO1udZJ+tbw6ehErcBVp9nOEhxgpI9sPt?=
 =?us-ascii?Q?kxZKTbUSR4mKA/GOfGqEvFi2jxtnDItHjCkKQ/ORHhieln2kKu407R+l2nbg?=
 =?us-ascii?Q?mhosnag/IjLwZ+WMWozq0Cz9ljQ1uH+iC2xIxKa1dj63LSIFC+TRd3UbDx9R?=
 =?us-ascii?Q?kQ93Rzg/ov6cykNArswDmrn34+fV2Ng9H5pNsAGJHPhvCGUstjbyLIk6ey63?=
 =?us-ascii?Q?2ETxkK++Ng8yyxAy5cCnm/xJUsAN6ztJ1uTx6xFMt/8HrHO/u+UFBhvx1bIt?=
 =?us-ascii?Q?nT0ZCQm+tTj5qWGnmN4w87QBMn7N6mI5sES4fOwEjQChCy4Supxfu/+wANS6?=
 =?us-ascii?Q?JnEwgcRlWHlKsp8Hv08kR/iKxNCpvBp9HOTnTZ+uE0EA34b763RpKOwDFjUq?=
 =?us-ascii?Q?z5+d2xFSM4aJoboyrzq/LXhf1X7jnXkhBWyCp2VwYXbOFrEFywYbHgpJ4uWx?=
 =?us-ascii?Q?FiJ+PahZleLqpQ9KhX08VdQvI9RHQlXSxxgjvbAsVry/Yb0whITfAZRbgfAN?=
 =?us-ascii?Q?T/8+G2JTfIKd2AaWt7JfDlYE8Mqgv+vPz6+pG2XJeNK76CQbQPwtwd10lmSs?=
 =?us-ascii?Q?fVh0+sSWdsU/76qRZJX7NmAlwmpDRPJycF+qnny/mSEvco8u7VxccpFLGDXO?=
 =?us-ascii?Q?B6FhYtc/3oNQxUYlY+FTxyGtyisk75VEyulpGGBLIs6frq5lN0/JI1ivSKwC?=
 =?us-ascii?Q?ubYxbnE3Kf3aUXbxvD2FJhIVzgiEu4jd1A23nu6APB/JQaq8aY3m7RGxDGDm?=
 =?us-ascii?Q?oE7pQpCyW7FFGLDbjG7qyeu6DOVvKHT5Y0cg38drXBif4o7yTbLpfZt/peTR?=
 =?us-ascii?Q?LISFP/reh407BVIYNjDZ1+UgcJr3bBCXB8o52PxwnemhA5rRnEXRHMQjU3FS?=
 =?us-ascii?Q?um5yB4E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ayq9Yv9jg2kq2AKmnZdS/xL3TQX/CmF9rOgIM7o0YE9EtFKCDCkFusSj27mc?=
 =?us-ascii?Q?Wc9qq9R6CesMZQPNFO7mHRq/8THEWpJbxJV0skSPrWrIqffA8FVguTMBPgOg?=
 =?us-ascii?Q?UPGVHrGemIocpPxVDfeq01olIv1fjZphyjdOh+4ZYDJX1n9gcJJmGdM3YPJT?=
 =?us-ascii?Q?vLsiW5sd/LVIID+bHhzhUCFSncLOyz7cXPizEmxHZiceAe2cgU+El2lS5/6C?=
 =?us-ascii?Q?Hn1o2EYN5vW9eOU7tM5v0s4RQynNBamuCi0VR/5621P8zNQLOPE/gkGg9f2x?=
 =?us-ascii?Q?Ibv2wQXpasc88QOedGOnHdUtO20eIeEjeCmq31RweTK8ijcn3n+DE7QJvFrO?=
 =?us-ascii?Q?ul2/Y2lEsHpotKalPIAL2iZRK+Bbhr58QVqjzzvk593UkXG+bCe2hko39vWZ?=
 =?us-ascii?Q?be/fxDHvUKwSVzxzIWs7snFFi2VsnAX2uVwfCFH4Ww5GPE0nfijb4UMjx2tR?=
 =?us-ascii?Q?nWbznGcf/Es30MyFmb0FtMEcDsuHmn6e1r4bxw85V//gKFSN/y9OKqOM417K?=
 =?us-ascii?Q?sq5dSY+9tY6D/ljKsbkjlR9Z+ZqBlVnJ5U2s00XgCLyQRYE2xxakN386v+d6?=
 =?us-ascii?Q?uJ5b19IORDN3OpYphfSgYopG/oGroYJiDTx9xT36JT9MwIShP7OgQyCoPMJQ?=
 =?us-ascii?Q?Cqp/yHTXpUiWn8sZokOBvEJL9F3rlR7sXtXAnSndhQKIz0+F67ohxEW0w4p+?=
 =?us-ascii?Q?18tvqQoJ8m1Zp5HXMzVl+1EUxzxAnGown49U4qVTzpzWnY1iP9Y/aHdFhZWn?=
 =?us-ascii?Q?op7A2C7gkBBoLcpmL7CdZff6GHO04udU6ctoKUpznF3DR2Y1CI61Zf7qH7KT?=
 =?us-ascii?Q?/doAjCvMRfGUjZmFrk87Fti5wbSVfBNGX7fvRS26a7bO/oc962Jiha4P7J9s?=
 =?us-ascii?Q?WQx0He9CECcnm10gFohunfYGifMW4BUbBkXvZ3lg1u9XdECWD96LpI7BCT01?=
 =?us-ascii?Q?+ShwuGrlviex7QqgvMOPaWQ4QfIWU0CF5R/8ik0y7RVBbvMndeA3dZPTGo8S?=
 =?us-ascii?Q?xEKsXgMKeAs854cjuYP850uEC+gaCNMo725dAPwq3TAiLM7uBhj/mSuIdysW?=
 =?us-ascii?Q?NF/eGDQ3zQ+9YdTeIx8dhfJHQAZkgMvGOjG5kE9f8eHmpQ0g387WkWcnoR/i?=
 =?us-ascii?Q?Q8acm6mkeA1/4quBmKojOheVHI7psyLiID41h0IX1hBDwmzpPhbCUvoLT6g1?=
 =?us-ascii?Q?7+ynyIILqWfIp6f7dmAcX8LTAvt6F2itLVltBeTFHnVAXx1niGmihAebq3Og?=
 =?us-ascii?Q?I2IA8XkQQQplKfasf5T7j5Vo5aiLCNekQ5/fdiwkd8hKfStl5RNZhZyipCRi?=
 =?us-ascii?Q?JEKegSkaJJyNgHX+NdtESV65WrpJW3jECm0vuP/pCj1FPq9KR1srnPwu5uCT?=
 =?us-ascii?Q?cwBP3rTdqjYW7HSs8OW3BY4mbUMyaokDjBKKJhsxfTxKYztfntVzKmZDCsS9?=
 =?us-ascii?Q?13Jr7D5DUgLJZXWmKk+2NKvWWPFSACco+QNBqIe40TG6lDbF4k1ohQNMlLrl?=
 =?us-ascii?Q?Kd2pJ+Oz1DfdeVeP6lk/rh8gfQZbUr9+bKPV03LPzOlsesgkzJdkVHK05IaA?=
 =?us-ascii?Q?pOGcUqG1ZkQNMFWIl4hjJ9ge1O13Gm8S5bNh+Ps7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	n/Xy/qJkplV5O/9xGBSViMfTaEuNSuqzxF8UiIo/d36wlheT9Vad5D5n7DPBAGfn2jz8RJf2Ci3gAsLxXqj4tM2WLhOwqr3DaLuYHoN5wiyIChZlU5uhNqJx89O8hCTYQsCNg34zggGv3XupelpQ1ooHr0+Lvc1k0Iada53TBZvrQOGuSCKVsLVrFyI15Tt8Wdgps4LBqkT3kwUrkudy5OPm7UeoVNEOs4qsiTOQWJ/8w4/jh+5BqBE5CkwIzzI5rmWvCOjXn2ykZO7uuiPWCAtexifl21CnnRDhaN8yWeELK6OYwhIGdpqnj+oNRrY4IQdsztY9ku/0mxOHsw5+kFrn+6aRugd4f7Pm3YVsup0stNSeRR4RpNx1meYqLJWy3tl16HuiBp0hQQGAax7jRJZnAUVmxkQOERGUMi6L18jj8m1GT/qKws2YYrF+cxeAoTPNvp5KLGVA2uwbOE/7HIEj44vz/buI3uep3sv0NKGynkdI+tlg5gmQFriERdcDtBJ4/p1eWiHXLtufmffQocSb1h8xJAXuZ1UKVuTpmJhnFmRa3D0sNfirEdBnemnHz/F10zJt9pkYduG3KfXQ0DzIwA2ClcHxWJvP8Dm7PSw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bee4960-cea8-46e8-21d0-08dc966b7e36
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:20.4107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WaqnOuYDCb+9CtGNLd6l9EX8k6W+bYtmEhLq6iVRRy23bBvfLI/1yZWHEGEBdLCEBAKZ/+od8hBysg+YaWKwgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: WlnMsxZt4SUFoOY3uAU1kUCbfd-4sQ7z
X-Proofpoint-ORIG-GUID: WlnMsxZt4SUFoOY3uAU1kUCbfd-4sQ7z

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/speculation/tst.zerosize.d | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/speculation/tst.zerosize.d b/test/unittest/speculation/tst.zerosize.d
index 56c1fcea..996f1257 100644
--- a/test/unittest/speculation/tst.zerosize.d
+++ b/test/unittest/speculation/tst.zerosize.d
@@ -5,7 +5,7 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2, chill not implemented yet */
 
 #pragma D option destructive
 
-- 
2.18.4

