Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166441ABEAC
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740682926; cv=fail; b=LxsN2fzjvQadXE6p0PeXSTMhk6Dt9Zofc4o88FXlYCtknY6cY+HPkAqaTjVnUPDZYOqSn39Kqj2Jl3OhjHlbb/ronZzk5FphRnERVX2SnZ2eyKRgf8s1K4Vnzey12lIvv4yTs70XCWHXRolteWg5wKTsD4e0il3wzmV8OphIhLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740682926; c=relaxed/simple;
	bh=gusDOCnqh2wx/Iok/01CVM/WIqpULcn6nZ+6D1VLzQA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=M23D7CYEqCH3WCG8JfmyyiSks59zNt5AQn5XTPIs2MvYs8UZNJWP1xTpix+SWgr8mvfoOzgjRGTfBnuzFXUZHrqOnh1tiFdlaq1fg+K4Owane9Gbbazt3qhflt4K8is6TcgpmnQ/245d/aOj1uTDpDH3tZ66b/gnJXB05De7x58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=evKdzOCw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zv35whZN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="evKdzOCw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zv35whZN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGfhlN027305
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 19:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=PPUw0N5qBCIcPLMQCYnpm3tFF3p3qEO8EdBh2lGjOfY=; b=
	evKdzOCw/gvlUI+3+G3T0hOoWScOZEYwWvPgjkKlZPPwVM00yPrQ1Cu5nDZ4nG7q
	bu8mj7End4jFR1lvHiiRXPNKbhVCWwB5b+UDm4/JDTSk2bPaM2fFEEEixzIy+8H7
	CiqNX1L/hAtwcc26TmGaPet2P+4fj25UzuZLSCTk8hx3QkvBYQuyWkXi1/DIJz1f
	iLP3suo8JU/5emJHQJW3Qg1Y2RAE+3QPdkE+0dwzEWpmB2o2XNV/RhcYdM6mYcl2
	iV9LyUiwb7XYIkfKT/ESkX9SYB+Cj6ER8zcxMkQxSagK52v3ruN7POVtryh8m5xz
	H8G7BjrcLGI/+0h4HMSLUQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451psf45me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 19:02:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51RHr2Bg025528
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 19:02:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51k55mp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 19:02:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPi5nZWzMPV7RKNxwQMJ+EhVb4Xr/eQ7hOhynmYxsJAZw9fSzk2fCWRLb93w89b9PuILkln+6lljbuoE/lqat/YgLpW7tyI6N5Tu8qyxxkeLCA0zsEbogT8xuU+gIDaNSvKDfqUf8CxPFTiZIDiNDmQPvq0sT6yHjCk2TGwjIZuEd7C+yQqdxeUhG0B0vV0q9dnXsPUqbCWdP/bp5jtjwSEEVub3cN6s3B/IsL9KT243gc8JQ9vi5AtYHMazkdyR3c1oFwDKdL6P2IOvy3iNSEmM9Tu1a3cg6fimjzLWHkaRZgkBxnQsqN/4qdUV47GxK0vxrh1R9p0ghPcRj2Pt3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPUw0N5qBCIcPLMQCYnpm3tFF3p3qEO8EdBh2lGjOfY=;
 b=mcYjxFHCmjqALQz5z/GCPgR1Kw5Yxq4e5YpBoIUzb1BUZbTc9LsAZy2CYMdGwzZ0Ifc0kiS0t+Ysbraz9dS8jsj3gii6QtaZX+zJDexND7FSOWqmg0rzk/44CN6BBsp7OzHDIjbSrrdRCbiDLEQu0BkOrU6BUET9r/6dMANoyUSs91Fjimo/nW4oYCMRVsLUbfb1MdBQaMXpGSH6JEN6KplRSantDz1Cpw5nxO4+nroxH2sdd15pwyne9/0xdVscxJDsF5F/lbljfiD+ImhzHvVPlf1wUvWS1cbGR8/8WAPD7208J0Lu08c++J2Mo358odrrYFnNNb0slZMi+qnmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPUw0N5qBCIcPLMQCYnpm3tFF3p3qEO8EdBh2lGjOfY=;
 b=zv35whZNgY7E2BYq2AKjrMZP47RMRxDWRqALi23pLs7MKhrm6a3ypQV8DaalfX5+iMzMPe3UMUUtfzr8zVyAQ4XkdhNmjXvNPXs2JeTpHm+LBEqeiEaqU7DbcYTI+kkDGfciD/iTdmjmVTRyiLiwJP5CF6Rkhbs1cN/QQzLYdvk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6487.namprd10.prod.outlook.com (2603:10b6:303:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Thu, 27 Feb
 2025 19:01:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 19:01:57 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/4] Rename _DTRACE_VERSION
Date: Thu, 27 Feb 2025 14:01:54 -0500
Message-Id: <20250227190154.23241-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:208:236::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6487:EE_
X-MS-Office365-Filtering-Correlation-Id: 2603d430-f126-430b-59d3-08dd57613556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZxKFLdaiHy1Th8lH7JQ8hyJ/cVSv4QVlPn9zO/kOK4cmTS7j8TniFsCWh7HY?=
 =?us-ascii?Q?NyoFTPSe8wwXFQcwYKJkleMppTjYqL06EKVcPkOwMSAvFoHSaAWmQaKbQiAz?=
 =?us-ascii?Q?d2pOZGwA77NeRoeFOPIOACvK82NH49G3xlYs+lQs89EYQdkJVDxo6TPFRWiQ?=
 =?us-ascii?Q?j78kWedUa+U5pLMddXGQ5NkvqasjucquQEe2pTNjBLIf+W/NUb0gtrcYYpqG?=
 =?us-ascii?Q?mMN0O28DoJQzPmulCMC6PoAuYVaFo4YOwYfyOMxyfeIIADa7K/AabXP4VN4o?=
 =?us-ascii?Q?RxECHJkjiyDB/+f1yhdJo0qVqDRBJ7hBnUA0E6R/7bId1YCoHmynXff0x17g?=
 =?us-ascii?Q?uhWWoxqGSftCUpKME0AC6jrrpIIGgVLukNnGiruQKpHA9zULiKmLkgYK/InS?=
 =?us-ascii?Q?ihVRBaTJ9K3jX6neyVWArMEP72HcgbECS56TwuYkV1NvqyhA7sw0NxVdxUBL?=
 =?us-ascii?Q?AgLGpqOAxT1M59renBzt0tRe23OJJMsT1gxkueJF0FZ82dSomsFVn6S1Nerb?=
 =?us-ascii?Q?gnPQxztxctK3i6wTrZF5QTpHS9qFffrlZcSSd7gQZ5F8XDm6+dIFuGsH/lE+?=
 =?us-ascii?Q?k2EFCwWFxwKSckI9XPzs6Bg/A3K0SufddTpR36myzEwwS29/Be5lxZmVwWU9?=
 =?us-ascii?Q?G/bPXC/3BXVk+WzjAh+/G0PMscam/61DcjNib05m8FvenPMxdEmyckNF8CCE?=
 =?us-ascii?Q?qhzSgD71/8Ao7vRHJNUXptDVjqx7vfnj36GfXOVpT6aiMlELlqnoz1XPMkMo?=
 =?us-ascii?Q?f3Pm2z+Vo10yFlF1J2LZBNxwXb6KEdyMt5iwpCWhK+rnQR94nJrWDndaoUhT?=
 =?us-ascii?Q?sahcbneDKmesp+SwOhjaR7vYgIpxUlqD9+jIaAP9dnHGFgZG2IZcniFIIUfl?=
 =?us-ascii?Q?XYEQpU91yriL2/5Nulj6bf0oW+QEYRtW85d1yuRemxXuH+TSndR7XkSCsWry?=
 =?us-ascii?Q?AxVUk4DcVLw+K1CXooUkUHbv9zuq5EI2ImkJR9ZBVohRig+dc4CD7NvFjx5h?=
 =?us-ascii?Q?lKDINoVaQalRVYh3vR6GLe8oJTSEurkSpPNU5XMxqe1TtCctPuM1oRnp1vcS?=
 =?us-ascii?Q?1yRGs7Wfv8xfXYCZvCQQtQgBqr8LLcGnP8TnWEutH+6/iuANC+Uyh0vQW/pW?=
 =?us-ascii?Q?p42BduNEAXwg0snTyKeypbHHMf49RhGlZRVSQi05aozkZr4OXKUGbwvrcxUW?=
 =?us-ascii?Q?t0uV0vuZhoPL7rceV0bIVCEYFAr1hnqGb4Q7m55t7w9FSH8jIemrON/WUEcU?=
 =?us-ascii?Q?uuGERl6siZpeK2xXi3ngt9ZjulY/zbl4CqNHUbSnxXXVFV/v4mGA67WnPzGj?=
 =?us-ascii?Q?8BZIw/0rLBStMxez2tg01seNDCQA354GAfvF1Zu7AMUKFLvE3fuRM1xns042?=
 =?us-ascii?Q?VZhaWqGwSMTlHJpNBKmV0tlfXFGD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EaMF/5Gbp47vhjS06NzABh3Z6goUdzTl+izzsiYQXXmK7ZDtACPOj9yV2SR7?=
 =?us-ascii?Q?ZkTkswuj9kdaT9bMWysFwzn+H72QX3u+sIRs9YZcDGP7w+TUztaNhhEMvy0R?=
 =?us-ascii?Q?QB0e0iC9GVQImhg1Uevhx+iZVSTF6xHdVy/KEuClkqXdaTg5quFjCw7G/E5p?=
 =?us-ascii?Q?qu5fJONwQjGOB8jYjMGdHFHdI2Bprg6msobI2nOfEeQup3tDbKj8aUewl7aF?=
 =?us-ascii?Q?0KCft9FsbooknkfR224AJe9Ch8Nqr9x9w1MURiUeJMCcqQp+R11LANr/wJXu?=
 =?us-ascii?Q?MfnpgOAMgpldGIVqPo90e+g5K40WY1YZCrOnTxN+qb/nW/BaP1mhG0lxZWdQ?=
 =?us-ascii?Q?W4apHb11kgrjLT5COaMGvx/X8nTcbfjCB6e11au1gQsB9oUa9oBzDLS41ikW?=
 =?us-ascii?Q?4093yQ31EmTMhCvLEZb4wQ0E/+teD1z9u0sINtP7AwDJDZilCjGFkju4ff/9?=
 =?us-ascii?Q?e+QoKKtPrvcAoH/wldggUIXqI7lTmktgcs9JOGUvftMOXSzosU7u1xQnGC2J?=
 =?us-ascii?Q?xzqVUgHJcvHKIcEX9c8q18DbgLAjqnD8pEUZ0vDwl6zsOA/zO23tP8TG4tGt?=
 =?us-ascii?Q?mdZl54HzzqCjJvfY/CNlr10fPA5l6lbEWtB4gdQGYJV5Ar+oNuCzwZZUzkjY?=
 =?us-ascii?Q?glDtAR+HJiD0ZPE2OCnqsA3XsOZqErnXgFvpv/aCkSaDvBhP+oYe4jyvBgEG?=
 =?us-ascii?Q?vz1ZCMc/vwC7S7iFgJxzRdO4lTwGeB1pVx8Y8zTi0Brt6DpKNh1TSm7LAnbt?=
 =?us-ascii?Q?IwiNqyZvlyddAss/14gjjkW1HNygdhbR36K7T5pCb5JjAJtoDqDNISvO+p1v?=
 =?us-ascii?Q?L99RE8rdwokFdnvF9625coKg2RB4QL1ytWjJrSESrrISmFgpDFveDTKUeWtM?=
 =?us-ascii?Q?p+i9G+gEFVFie0uG09/A9ZDuoijM8tI26QiHKbJczpK/hhSENZEZMMIBS/JE?=
 =?us-ascii?Q?5oPdXsjQgVVZYMCTHLi1kVa87FW72lg9nUBCQR+hpU1YZmpmjG8wptYho0v+?=
 =?us-ascii?Q?e5p9f9bknM5LZ8UpB4Gt9rNiqYmWsvmySfb4X9UcNsG90z85AQLBn+yS6uIs?=
 =?us-ascii?Q?gRAy8NMwmNk/t4+LF1/Ft9fUbzFxw0IhSc6lRhUsRuX4pdhzuLr/oA7L+EJY?=
 =?us-ascii?Q?NKCmqOde1sb0lF9HBWYfjEXozmDFw17KGZIMQtCLWHr7qPluy6s/K+NhkmPi?=
 =?us-ascii?Q?ofdpPpsoBQvXuiiLAjdXd2kJSRP/+Z27qhHZ0asd98rMGWTDm23hrnsqJkT7?=
 =?us-ascii?Q?+yASK7NiEoVHo014Upz7rDYaEbxIb7WYBtDebLuHPVX9yBcPosD6aYDDEo5i?=
 =?us-ascii?Q?wTiqzBA9nwxjR/cUaf+te/wXxsI4Dh6hAYogkhI1TX8vbIWj7KfnHxcZhs8m?=
 =?us-ascii?Q?sMD//fWlNgB4+12cJlBae7rZOSM9zs5isOeUrtzj5YCwj422XN78R69Gwgik?=
 =?us-ascii?Q?OfE6bzBCI2bw3EB4hqWHDG1/sKgdk0VqMlpTOIFwGjtGNPFV9U2rb3F5G/4c?=
 =?us-ascii?Q?Ok8m8o03sCyjUdYSEku6Ip4dg5EcWsNXWugg/XlvgXkSL45mQN/7IwCP8nOJ?=
 =?us-ascii?Q?BnFud3r+4kSzCJ8kguN6Q131lulNn3LyrU/OVdZR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ro4fA6oAG8ofFcMm6NDbcybN/VPPTkTk5gkjeV2gZKPXeSlnHea6Cn3RVwpxBTwJZ8qJUxHdIYe34s/3BQit7EtOujlSTjdJrFLqyXDhgikSHPWq7/UoqZXFWwxhDgIG8f6cF/pFNcMxhU3wPdIR6QjN4P0y1U0h2x47+BNSmavsC3oZ3i0iubO7+MKoo9X7BitzCC/qCRwqP1948cCgKQabmV6b+HKr4+ztZsb+SyjsjqTmDUO1S2uo+MjO7znIUmas2rJK2HFLJvhFdILHYgpT3Cm6rrUaI5gFCIET5Jjjl5FXquKK8cbibqq6tKI4wLwikPEb+juujjFzGPVP3k6ziYi4iA9SMB7/fLkhzqmR9DHZUeNkHG5FG3eY6QPXlPH5Uaace915uCb/CrFayMxdCQEk1zjAjOEg2d2MRnJqAmoYz0nI8AgFUcHDASJG0ixGRrEltaHQpdyxM0g/GNqe0JJZx8hg0EIbCkM1DVbN7mRDudT99Us7CYMW7KRxnKUaqWAw5wW3/KF54RYH0ME4n2Cd+oQIpL2NCltWd7MvL1iWUXqpbfYnefCpiIC1tkMeVgDHpRXwnnTdpmuLJyWkB9FIuLyJ/0zaIhR8ZUo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2603d430-f126-430b-59d3-08dd57613556
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 19:01:57.6003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fy9JNpu3VoVZK3fzIdXwLnsGIJSmQrMpOCVFEHYhuMz4w1GXqT0whpULWwokgXxRt6yocjOsxUtdHx4Pim7nbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6487
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_07,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502270140
X-Proofpoint-ORIG-GUID: -o6SHwgKDkOU_ZC45VUM4Z0Kg-NvkNGw
X-Proofpoint-GUID: -o6SHwgKDkOU_ZC45VUM4Z0Kg-NvkNGw

From: Eugene Loh <eugene.loh@oracle.com>

There are many DTrace version numbers (for version, API version,
package version, etc.).  Meanwhile, _DTRACE_VERSION is not a
version number at all.  It's a preprocessor macro in USDT .h header
files.  Prior to commit e2fb0ecd9
("Ensure multiple passes through dtrace -G work."), it was perhaps
not even set.  With that commit, it was always set to 1, with
the rationale:

    Also add an explicit define for _DTRACE__VERSION in the generated
    header file from 'dtrace -h' invocations.  This seems silly, but
    it is there to give people a skeleton to work with if they want to
    pre-generate header files and select whether to actually compile
    on the probes at a later time.

Rename to _DTRACE_USE_USDT for better clarity.  Define it only once
per file.  Place the definition inside an #ifndef test so that a
developer could set the value without manually changing the file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_program.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index 23b91fb2e..cfb7a5fc3 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -505,13 +505,12 @@ dt_header_provider(dtrace_hdl_t *dtp, dt_provider_t *pvp, FILE *out)
 	info.dthi_pfname = alloca(strlen(pvp->desc.dtvd_name) + 1 + i);
 	dt_header_fmt_func(info.dthi_pfname, pvp->desc.dtvd_name);
 
-	if (fprintf(out, "#define _DTRACE_VERSION 1\n\n"
-			 "#if _DTRACE_VERSION\n\n") < 0)
+	if (fprintf(out, "#if _DTRACE_USE_USDT\n\n") < 0)
 		return dt_set_errno(dtp, errno);
 
 	if (dt_idhash_iter(pvp->pv_probes, dt_header_probe, &info) != 0)
 		return -1; /* dt_errno is set for us */
-	if (fprintf(out, "\n\n") < 0)
+	if (fprintf(out, "\n") < 0)
 		return dt_set_errno(dtp, errno);
 	if (dt_idhash_iter(pvp->pv_probes, dt_header_decl, &info) != 0)
 		return -1; /* dt_errno is set for us */
@@ -560,6 +559,11 @@ dtrace_program_header(dtrace_hdl_t *dtp, FILE *out, const char *fname)
 		"#endif\n\n") < 0)
 		return -1;
 
+	if (fprintf(out, "#ifndef _DTRACE_USE_USDT\n"
+			 "# define _DTRACE_USE_USDT 1\n"
+			 "#endif\n\n") < 0)
+		return -1;
+
 	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
 		if (dt_header_provider(dtp, pvp, out) != 0) {
 			dt_htab_next_destroy(it);
-- 
2.43.5

