Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FF026A0B9
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103417; cv=fail; b=HzadLHPX1i2k5BJkBniocCGsgXcaaVVxOGzwphDGc6RWClDrwDkBUp/6aSYYqwD0zp/09g1P5r/u2I5+/buIm5cQVn5gr0VnfdPbBaTEUaB0q2NK0uvxuL7S7UnyIQQSf6cWAgt92hhWuRYX7Q7icbLXDmwgaZhpn5w40EnuSzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103417; c=relaxed/simple;
	bh=xFOYudwLOVEFWSiJ66lPFHqvE9k0z5FBSJBqsJ0gdTw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UkEmof4KnDRWV6sKHq8qYUbTiP438NxwHzYva8xBZJ2DbGwsblcXZLFhC0KPWokvU4hDuL01lTR0hd2m3tpzW0PKOjHDtl/WcDadPIebxHHypDezC048qcgjTJg5InZUdqfRn7p83rgMFNE/TwBmet7GUITPMFItRr1N09Qp8gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Iyp9Uzys; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cdKFxwSw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Iyp9Uzys";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cdKFxwSw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NRUx005591
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ztTJ5L5SnVRV5YQbDd
	ovSzqMSc/J+1l+RZu5W7B9mqc=; b=Iyp9UzysO4XyL9nDmgnpwwK3FspICeEuRj
	ZHuvUfHjKZTfIxLILOXBinV+JoeSUPcR4mYu9oMNTzMjs5OyFhL+pfpsq618UtkB
	dsRhbKa9OJvolFroEV8iWRUGgRkHwM33/2rpOg5N5VTVimo0GvyQdqKgzaTd3u7O
	fmZnfc0a+jqnV+QJj18yjwbkL+S1OPtCUQxcZ3jYFXigl/S/07l7PUYKw1tUAL9c
	wDB5+cX++/gk9pkigkFZ0ZiGzsEHtObhPJimSpLrT4LZYaUCCW8J/0SBjbkF6fh8
	U/hdKEoLYFA2ykI7KhxOuy5C6f1woPFwJfPZfc9iTaeBFESu3CPA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2waxvp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3LUx6032285
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012027.outbound.protection.outlook.com [52.101.48.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bdn3fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oM8DxnB61vYoBWBd0A1NHUYKDw+c9vVTgusWWM5vuUUbCri/tw+rOTgSSJEcGitCcsbI+DVARl+9GEgWB7FBXbJwlJSQfTE64QMNL/IuK3b0Awzf5O08A+6xwv7a1vEfQR/ax1ycP562z+3hNILNQ5XJ5sINDdRGJgEm3TPEVHb99hG825f2wP6d0rSuYWPhai2u3gS8bOjivfABvcSkWOEOKDTG+Dc1QUc/6l1/joYj8fWJbkbQWQ+n2XboxlqNUlXZCHuGO681i719fkKrxEYKYw23F2z4MobZHHhMHnSRHyEl4z4L99jpEHIZdHJPJYF7oZQzsKio1mTAmfW+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztTJ5L5SnVRV5YQbDdovSzqMSc/J+1l+RZu5W7B9mqc=;
 b=pAYJu+Lz4uC09L/s6ycK+y/Tmt8qPtbIHyRiyFKyNCJOUKeGtVCab6Gm+bulx1MiHYX2CFQJoX7IKgpGaax3oI+fI529SziT98UQlFtm6MKhcvPxlltYVQgciPAf+jXlXCaZ5v7XwcoyYjYxAUM4OvlSNTojuj/hKbKqP7h3Fd+3zE8mi1EweRCWKlIAMaTDDqlUm1p9CITl8OCg83UZfQC9PLDmARc5DcFCYB87bGtJ2EqLFXXaj4nC6dU0Cn8wJK2WlqBUff7FeM0JGzF206t405drWfHH8zbE2r7U6f+0FtuQQeAqaxB1/YeQd8/EuoQ6KK+3bLx369HHOoV9gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztTJ5L5SnVRV5YQbDdovSzqMSc/J+1l+RZu5W7B9mqc=;
 b=cdKFxwSwTEyCTWMztaEZhe8Ckyw/qKM/WcuG9zGOzSbJtLV0jkOhhBuBhPp+5wVdgnB9eCyvTiVEk1WzqjSTHwNFdhrE3kHuW3AWkCqs0pCZ4J0ESab9Xdq4S4ecs5gc2Hi2nCU948KeVegEYhMa4EZXt2+IJuSLYHWbVDLXzvg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:22:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:22:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 06/20] doc: Clean up dangling anchor links
Date: Tue, 21 Oct 2025 23:22:37 -0400
Message-Id: <20251022032251.2010-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0116.namprd07.prod.outlook.com
 (2603:10b6:510:4::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 797de52e-1d5b-4530-6160-08de111a4ac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0R9sjgR8GzxvRpUiUOCwOnAdibyLIaAaeQSnJFAsgZLkNRHt2mYHijroedEy?=
 =?us-ascii?Q?x0yGW35NVA8GvnkSBAm+CtTkb7pGtDDwZ2dNe+kmTjyk/0IQUsQi7EGZpY/C?=
 =?us-ascii?Q?kldfwDfB9OBN2lqvspUct7OtgFAXLTtRCFlltKDJ8ZwNXT1BhzoReIVMK4kD?=
 =?us-ascii?Q?r40MRd2823HGpDbUkOwC4cGevfELiXD7ASeoN72cpJN51vTAeb7Q5obPRcJh?=
 =?us-ascii?Q?kv9OVZ8SeDsq5e6U5NY5bGLdbFboKcQtTZi/4a18DWPmMCOq7Sl5r98Gt05B?=
 =?us-ascii?Q?FsBXd75oUpYu4p8xOB0CfG21ZJjvEXyzLkkDHd7EGzsKNaX/awyXp9O5oH8S?=
 =?us-ascii?Q?pzkFvZM+jXNsyKNdII64aGF/tu1oT//IqfF3wYvK1C1RB6vwsAOQMPBA6/F0?=
 =?us-ascii?Q?XFFL3AB98TTG331BZLPN/VSbhLncYcgxPSG9EQFJpPfZzWaeA2oDUmrreqYK?=
 =?us-ascii?Q?Vkc2KdRKIjV2zxbAeE7bTEtMaD305JfO9RxybUR1NbtCGjrwCvA4H8Izp/jQ?=
 =?us-ascii?Q?Szi6yPrIBoxbKeVUblU3AKjLIUa089+ETQcTb2oOpidqLqu17kaRxk2kFemB?=
 =?us-ascii?Q?Fas5HV8knL/T8m1Le89NS8Rb115E2insnpo6EfDfZui7+qeBPvSbjiGULWD2?=
 =?us-ascii?Q?XOOKzbQAn7/GqIC/Net0+vm7E2/Y5LjexsPFzYXx1rGdGfJE8Y6PJqMlyDVA?=
 =?us-ascii?Q?jOC/mQQFFZsefNfhAM7f0mBKr5IgvoE4Z0bN0LTRcT5FqK1NhUiuZggxiBvN?=
 =?us-ascii?Q?ZJTTNZGYDjaVU7cRnfYiSORZWiZW5PGRijNzu8AMyJY9aWIVr+CMUi6fdGJB?=
 =?us-ascii?Q?stAhQ0u9YlEVq+gWzHD5wogQ/3Ophcv2sCRRwvphlK5OkU9/uqTxXpP8MHeJ?=
 =?us-ascii?Q?OZSEODg+ks2cOuqpuGHiHuFan8tK5VBow/zjK21GqMBBEX0e3UfufcxZveed?=
 =?us-ascii?Q?3XNPXK7KPsFs7FQgQ1BXYxmHDzq3dxeUBQSMNtImdjTvkCmzLRSkP/V35rsz?=
 =?us-ascii?Q?+ut7+R3K7o9e006jwF138v7hTK7xfKZPU7vgHAs+HYX16jHaRvCiE07OhTAX?=
 =?us-ascii?Q?CvbeFqTeeboTKFz1QTL3JqcyAPf5pAHqmA0OpkoPv1JVJFSVYzDwVTeO8FNf?=
 =?us-ascii?Q?TKAzfUdq8+KZOaIuqILsnN4NADzRWVXQoWMv97FW1spymZX7DJ3wwJtqdXQM?=
 =?us-ascii?Q?mymXM2En/oNV8p+xlk9Lq04pFTSW7ETbPibccLg0Hm7g1etnqBeCtEGhEuVD?=
 =?us-ascii?Q?UlGZI/wpepbstBwWUUkmrFLVL912alyHXXUsHA5SFICih4bOJm0R7EK/IXoi?=
 =?us-ascii?Q?csTa4rtmMjyUgdltntJavRXD0zxsCy5s0w7q3YVNUGoDCk2ooSB5F9IRx8oV?=
 =?us-ascii?Q?F840fxxXRlZpXGCEk8fhuXSfqoUxeswS8xUv5Xeqw2Nm5YqSEhwH7J/2eRFZ?=
 =?us-ascii?Q?zMw2QKoV1J8YFGXCkDVdprxRGKh54ohd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iJRJ9olaG2Uw0S+X7z2EJFVHEWcOwt7BWncOSKFwZlhbVvTawipefZRiaSob?=
 =?us-ascii?Q?4QKsa6GXN+8bGQ3ljB0waTOD867V7sEOi7Ahji8yNi8iUk85yvybTaj2vNe+?=
 =?us-ascii?Q?cY1YRYW8tX9xwLBVtIZdw9syRdAFGUFa5Oh3hMFkSFniwoZ6zPECfPuPUtTg?=
 =?us-ascii?Q?9KRAp99BAxNWLA9Z3KeEzL9gGOsukHT9GK/nKza7hAxLQXwZA1T5PM7MoOG2?=
 =?us-ascii?Q?AeqLY/flUNpJhRfdm2vgcfSwShsLm8HtFCQcWJ381sKBVnISQahg4hJcNqpN?=
 =?us-ascii?Q?ZzmzlUkW53aropUG+EZpNKtntjnU8Rd9K5eSsFdCAQ4iW/p8AeaJTt16EALq?=
 =?us-ascii?Q?IsjskQ7MVHZ6PyHe+/gxNbwzlgOsMfDdFNRPAu9gK+EqwQofrZq2PrhQ3GI7?=
 =?us-ascii?Q?m9ymXbhIhwiYkdHTOkUoIWfMnh8kkGBzZHIe5beGpRHaqMvbrjITXizT4DXE?=
 =?us-ascii?Q?AlB/HpIbLGpjjiLBSqcxo8eQ/ElBgucl+3Boa/ODAvqiE2ZGFBkGQPev4DGx?=
 =?us-ascii?Q?0lYccokhHPCX61sPdjOALkHBnaBxmUYaE54POkp2WBQqJ9bUXp4OTdcBxLAl?=
 =?us-ascii?Q?psovXN82/ZMj8fmLiRWt15J83EgIKhLUP9iD7sr3UgtJ+6JN3jyhWfUHzP+M?=
 =?us-ascii?Q?+7rG2e8/mrOj4D3CT24hNXWf7DNzWOUh24t5hgbm7H9/Cdr+9IICfZdksf5T?=
 =?us-ascii?Q?E2BXlaMaUeccF+je+a0XfSB14yCXKzKNGauxLdjNieBO/yyZhAW9ZQXA8mfo?=
 =?us-ascii?Q?RmEW05QCMCD0IQCKNNVARhs/Ef9FrW8BrZeI3Rc2IJoX1kjJOhkl7SMS+zLj?=
 =?us-ascii?Q?xoSDsD5EH5SOZfI3U0aVvuUZRfDkQAdsUN4dC+3XTd+xp6B+VgF4b9HQ2JRg?=
 =?us-ascii?Q?50usxyQhkJL27QOAHjgdX+DD0o85bXhZTuFwouaSgf8jSo23ljlpAqI0UWfN?=
 =?us-ascii?Q?hmGic5wtdJhMskvdl9w5KFh88TUVFi3OLcd5Rb5nCg6Vm2IBYc8e/fz45cED?=
 =?us-ascii?Q?q+rKIL2HZXClzjHxvfgo8ycVh69gxJcZiM7dFYuds/NZZO6SLBWHM1gtPzU7?=
 =?us-ascii?Q?Xo5+zNNP5yb+YZF133o/n4Pre0gXeyijSX+tChcYgmsKQJOCqYP3xFUYfd8o?=
 =?us-ascii?Q?zcSP0fs2AOmsmkmkGqezq8IW9oMnbOTmbay2QrSlKDe97ebqxReYbI9cva2J?=
 =?us-ascii?Q?XrewnjM7RORpbznv7SmXAXW1Wnu1UmaFx1Id6IRXci3sVzzeh0OMle5Y//IC?=
 =?us-ascii?Q?bzny3/oDbGksXE6yxos+GHo56AUNQmBquutHE4m++QmCb/51W4xgGywaSS59?=
 =?us-ascii?Q?k062StCSs8DzCRRXzcEJmshcWlvKXZUEB9PNjEmiC2mQU7nJ7e17KhX7r3m8?=
 =?us-ascii?Q?okwGHnbzUG/Jk9lok5lWMTQBI95I3bEc/9gWrWGE0kj1fwsG/AS3fDjFnPpx?=
 =?us-ascii?Q?7apk7GtKGN5uLRibN9qdefIMQwo1EUwgs1QZDruEZCTOpn1I3DLKk85yEACE?=
 =?us-ascii?Q?zZwkBqxdcV0u8Pacvnq7qSD4WbBPBIKjxpVGihtNk6k6YKq/ucY5S+EkU35x?=
 =?us-ascii?Q?X/t2zYLXTys1ltW/FzhK+6ixjw0gJcDZKL7FrXSp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V9gS4sdp2XE597WPvSk3rrlSOAcl9z3yoDaDKzAaoHV23OpRB3lzi/FicelUmRV7r9i9opHxIwKJL613l6mjvFBgJPWp2YlzjdytC6a1WfVm9YD1WR1sKS/8MTKDR2OZdV33SXYnDtZcqZrSVxfdDq7JS6u+tVE0Y9+i7pZKHUgN6FZwDxOOvP0hhnkbi0N9im9Jl0h5HW0kyDgkm5UnJf5huzFixvkSN2YQWDhuTGNOzPYRFfBwSIiclUiaJSdk9h8w7gacgo7wpvUfoBHZJiK4c7l5jACuTsyxaMAxBeulKN5z9CKI21CtaA7dvcHcSznzRYGgkIoW4jV+GVl6HCXxpNCdKNVrAZAGoYb/wmi5Fp1RimTDq72R8QJhdPalXZAwz4WgSfmsMiyNfnwDXGVtWER/FYVFJO01Dr10XsgH/0djSyFxUacTdghvb+ZKYmkje1pDfONQpIcctga+0S1EYt/BgjNq/sCIZPxgoZXPO/ij1fI1xowNeSsizZUOkeZBdvMqc1TnRnhzwvuhT1YsoW77jxg08FhFV5r/BN4K+0ZJEEfDeLXFW4c0MJETUozUsOpm6AbACQ/drADhRUy7JKHHqQpxwDDfsNFAIXQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797de52e-1d5b-4530-6160-08de111a4ac9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:22:55.7833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L87ov/h6DBImv1c+vmnPW4xOXOvM0g/tRJr+pWc2P1nFxQddix2PXQyjWnwle1q+shfQR1o5uhKKbwls/87WyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510220025
X-Proofpoint-ORIG-GUID: 0A51yDqnErRF8wxYyJiJ5Qt0sqNzbi60
X-Authority-Analysis: v=2.4 cv=Pf3yRyhd c=1 sm=1 tr=0 ts=68f84e34 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=1I4LuXStgUQjPqsxYl4A:9 a=Vl0SkxlkIPbKrL4X:21 cc=ntf awl=host:13624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX5bX2Yv8a2j5w
 PmjHYN8ZzzT6EF7MAxUq6Kq4uE1HO4f7T4yb/6eJMIVxTKBU0vBPkz8o7D8s5GOUDsBHmikiBR6
 cJElvVVzemIs4Ki8N/xhn8a9AvARerhxev9KGsc2D+7qXqD9ExsxrufmBgkmyGlBnhhtSu3522s
 xTbIACPbQzX6U4iVW+rIxr7FG8RpNJS+bb5oHZGrUk3hP6mgqvvdrlQ5khHhuHDNNaofApm5hLr
 VbCMb90w6qUH1XbYKuGVECCruGRofYpwYhA7GOP817AHtxDBlkvWwfIJrdU/zQEIzx9mgqfhxtz
 nTdb4GlwtRsaaaFUGyAhtBhBMMdhuPhBO/RaAo4IVxc8O9Uh/cJfHnzUvxErfxp1qaAaGmTkhm/
 YXqMdAwySgRa5FJoEYfPfvfAiStM70oeguR2XZVvvMjaBiBxRCM=
X-Proofpoint-GUID: 0A51yDqnErRF8wxYyJiJ5Qt0sqNzbi60

From: Eugene Loh <eugene.loh@oracle.com>

Links within the User Guide can point to specific anchor tags within a
page by appending '#' to the page in the link.  A number of links have
the '#' but no tag.  That's okay, but tidy them up for a cleaner look.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../dtrace-components-and-terminology.md      | 10 +++----
 doc/userguide/explanation/dtrace-concepts.md  |  4 +--
 doc/userguide/how-to/dtrace-guide.md          |  8 ++---
 .../dtrace-howto-create-a-dtrace-script.md    |  2 +-
 .../reference/d_program_syntax_reference.md   | 16 +++++-----
 .../dtrace-ref-DTraceSupportforStrings.md     |  4 +--
 .../dtrace-ref-PointersandScalarArrays.md     |  2 +-
 ...dtrace-ref-TypesOperatorsandExpressions.md |  4 +--
 .../reference/dtrace-ref-Variables.md         |  4 +--
 .../dtrace_builtin_variable_reference.md      |  2 +-
 .../reference/dtrace_command_reference.md     |  8 ++---
 doc/userguide/reference/dtrace_providers.md   | 30 +++++++++----------
 .../reference/dtrace_providers_proc.md        |  2 +-
 .../reference/dtrace_providers_sched.md       |  2 +-
 .../reference/dtrace_runtime_options.md       | 14 ++++-----
 15 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
index be6c649d7..b187055a4 100644
--- a/doc/userguide/explanation/dtrace-components-and-terminology.md
+++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
@@ -3,7 +3,7 @@
 
 Learn about the different components and the terms used to describe them within the DTrace framework.
 
-DTrace is a framework that dynamically traces data into buffers that are read by the `dtrace` command line utility. The `dtrace` command line utility can run programs that can implement certain functions by compiling D programs to generate eBPF code that's loaded into the kernel. In practice, all interaction with DTrace is performed by using the `dtrace` command line utility. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md#) for information on how to install the command line utility.
+DTrace is a framework that dynamically traces data into buffers that are read by the `dtrace` command line utility. The `dtrace` command line utility can run programs that can implement certain functions by compiling D programs to generate eBPF code that's loaded into the kernel. In practice, all interaction with DTrace is performed by using the `dtrace` command line utility. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md) for information on how to install the command line utility.
 
 **Parent topic:**[DTrace Concepts](../explanation/dtrace-concepts.md)
 
@@ -31,7 +31,7 @@ Output is displayed to show each of the different values that are used to refere
     ...
 ```
 
-See [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#) for more information on how to list and enable specific probes.
+See [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md) for more information on how to list and enable specific probes.
 
 Probes are made available by *providers*, which group particular kinds of instrumentation together. If a provider is related to source code, its probes might also include information about the piece of code that the probe relates to in a *module* and a *function* identifier. Therefore, a probe is identified by a *probe description*, grouped into four fields:
 
@@ -64,7 +64,7 @@ Some probes don't have a module or function identifier when they're listed. When
 dtrace:::BEGIN
 ```
 
-Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md#) or the [CPC Provider](../reference/dtrace_providers_cpc.md#), also don't include module or function identifiers in their descriptions.
+Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md) or the [CPC Provider](../reference/dtrace_providers_cpc.md), also don't include module or function identifiers in their descriptions.
 
 ## D Programs {#concept_terms_programs}
 
@@ -119,12 +119,12 @@ The program probe description matches all system call functions at the entry poi
 
 Although you could code an application to calculate an aggregation for a set of data, when many probes are firing concurrently, they can overwrite each other's updates to the aggregating variable or the calculation can become a serial bottleneck.
 
-DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md#) for more information.
+DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md) for more information.
 
 ## Speculation {#concept_terms_speculation}
 
 While predicates can be used to filter out uninteresting events, they're only useful if you already know which events you need to filter. Because DTrace is often used to help debug particular system behaviors, DTrace includes a set of *speculation* functions that can be used to trace data speculatively.
 
-Speculation is used to trace quantities temporarily until particular information is known, at which case the data can be discarded or committed. By performing speculative tracing you can trace data until you know whether it's useful. For example, to trace data about events that might trigger a particular return code or error, you could speculatively trace all events and discard the trace data if it doesn't match the return code that you're interested in. See [Speculation](../reference/dtrace-ref-speculation.md#) for more information.
+Speculation is used to trace quantities temporarily until particular information is known, at which case the data can be discarded or committed. By performing speculative tracing you can trace data until you know whether it's useful. For example, to trace data about events that might trigger a particular return code or error, you could speculatively trace all events and discard the trace data if it doesn't match the return code that you're interested in. See [Speculation](../reference/dtrace-ref-speculation.md) for more information.
 
 
diff --git a/doc/userguide/explanation/dtrace-concepts.md b/doc/userguide/explanation/dtrace-concepts.md
index adb5413d3..6e2b91a65 100644
--- a/doc/userguide/explanation/dtrace-concepts.md
+++ b/doc/userguide/explanation/dtrace-concepts.md
@@ -5,8 +5,8 @@ Explore DTrace at a conceptual level and understand DTrace components and termin
 
 The topics in this section are general and can help you to understand what DTrace is and how it works.
 
--   **[About DTrace](../explanation/dtrace-about.md#)**
+-   **[About DTrace](../explanation/dtrace-about.md)**
 DTrace is a powerful tracing tool that's available on Linux. DTrace has low overhead and is safe to use on production systems to analyze what a system is doing in real time.
--   **[DTrace Components and Terminology](../explanation/dtrace-components-and-terminology.md#)**
+-   **[DTrace Components and Terminology](../explanation/dtrace-components-and-terminology.md)**
 Learn about the different components and the terms used to describe them within the DTrace framework.
 
diff --git a/doc/userguide/how-to/dtrace-guide.md b/doc/userguide/how-to/dtrace-guide.md
index 137d62e3a..02863588b 100644
--- a/doc/userguide/how-to/dtrace-guide.md
+++ b/doc/userguide/how-to/dtrace-guide.md
@@ -8,12 +8,12 @@ Most of the information in this document is generic and applies to all flavors o
 
 The topics in this section provide guidance on how to perform particular operations with DTrace and serve as an introduction to installing and using DTrace. By following steps in this guide, you can get started with DTrace immediately. After you have explored these topics, you can either review [DTrace Concepts](../explanation/dtrace-concepts.md) to get a better understanding of how DTrace works and how you can improve the way that you use it, or you can use the various references that are included to find out more about writing D programs that do what you need them to do.
 
--   **[Install DTrace](../how-to/dtrace-howto-install-dtrace.md#)**
+-   **[Install DTrace](../how-to/dtrace-howto-install-dtrace.md)**
 
--   **[List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#)**
+-   **[List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md)**
 DTrace providers publish available probes to DTrace so that you can enable them to perform functions when they fire. You can use the `dtrace` command to list all available probes or to enable a probe.
--   **[Create a DTrace Script](../how-to/dtrace-howto-create-a-dtrace-script.md#)**
+-   **[Create a DTrace Script](../how-to/dtrace-howto-create-a-dtrace-script.md)**
 Learn how to create a DTrace script to develop understanding of the D Programming language.
--   **[Use Predicates For Control Flow](../how-to/dtrace-howto-use-predicates.md#)**
+-   **[Use Predicates For Control Flow](../how-to/dtrace-howto-use-predicates.md)**
 For runtime safety, one major difference between D and other programming languages such as C, C++, and the Java programming language is the absence of control-flow constructs such as `if`-statements and loops. D program clauses are written as single straight-line statement lists that trace an optional, fixed amount of data. D does provide the ability to conditionally trace data and change control flow using logical expressions called *predicates*. This tutorial shows how to use predicates to control D programs.
 
diff --git a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
index c4fcb4ed3..199649a9f 100644
--- a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
+++ b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
@@ -3,7 +3,7 @@
 
 Learn how to create a DTrace script to develop understanding of the D Programming language.
 
-Ensure that DTrace is installed on the system and that you can list and enable probes. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md#) and [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md#).
+Ensure that DTrace is installed on the system and that you can list and enable probes. See [Install DTrace](../how-to/dtrace-howto-install-dtrace.md) and [List and Enable Probes](../how-to/dtrace-howto-list-and-enable-probes.md).
 
 This tutorial provides successive steps toward developing a DTrace script that you can use on a system to gather useful information. You can use this tutorial as a framework to create other scripts for DTrace, in future.
 
diff --git a/doc/userguide/reference/d_program_syntax_reference.md b/doc/userguide/reference/d_program_syntax_reference.md
index cd1ad5c1b..862ce0322 100644
--- a/doc/userguide/reference/d_program_syntax_reference.md
+++ b/doc/userguide/reference/d_program_syntax_reference.md
@@ -3,20 +3,20 @@
 
 This reference describes how to write D programs that can be used with DTrace to enable probes and perform operations.
 
--   **[Program Structure](../reference/d_program_syntax_reference_program_structure.md#)**  
+-   **[Program Structure](../reference/d_program_syntax_reference_program_structure.md)**  
 A D program consists of a set of clauses that describe the probes to enable, an optional predicate that controls when to run, and one or more statements that often describe some functionality to implement when the probe fires.
--   **[Types, Operators, and Expressions](../reference/dtrace-ref-TypesOperatorsandExpressions.md#)**  
+-   **[Types, Operators, and Expressions](../reference/dtrace-ref-TypesOperatorsandExpressions.md)**  
 
--   **[Variables](../reference/dtrace-ref-Variables.md#)**  
+-   **[Variables](../reference/dtrace-ref-Variables.md)**  
 
--   **[Pointers](../reference/dtrace-ref-PointersandScalarArrays.md#)**  
+-   **[Pointers](../reference/dtrace-ref-PointersandScalarArrays.md)**  
 
--   **[Structs and Unions](../reference/dtrace-ref-StructsandUnions.md#)**  
+-   **[Structs and Unions](../reference/dtrace-ref-StructsandUnions.md)**  
 
--   **[DTrace String Processing](../reference/dtrace-ref-DTraceSupportforStrings.md#)**  
+-   **[DTrace String Processing](../reference/dtrace-ref-DTraceSupportforStrings.md)**  
 
--   **[Aggregations](../reference/aggregation.md#)**
+-   **[Aggregations](../reference/aggregation.md)**
 
--   **[Speculation](../reference/dtrace-ref-speculation.md#)**
+-   **[Speculation](../reference/dtrace-ref-speculation.md)**
 
 
diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
index ea9dfa306..98f482c63 100644
--- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
+++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
@@ -31,7 +31,7 @@ In the next D statement, if `s` is of type `string`, the string type indicates t
 trace(s);
 ```
 
-You can also perform lexical comparison of expressions of type string. See [String Comparison](dtrace-ref-DTraceSupportforStrings.md#).
+You can also perform lexical comparison of expressions of type string. See [String Comparison](dtrace-ref-DTraceSupportforStrings.md).
 
 ## String Constants {#dt_strcon_dlang}
 
@@ -80,7 +80,7 @@ Scalar type expressions, such as a pointer or integer, or a scalar array address
 
 ## String Comparison {#dt_strcomp_dlang}
 
-D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md#) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
+D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
 
 <table><thead><tr><th>
 
diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
index c68982d40..da4b69333 100644
--- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
+++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
@@ -53,7 +53,7 @@ dtrace: script '/tmp/badptr.d' matched 1 probe
 dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address (0x0) in action #1 at BPF pc 156
 ```
 
-Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md#).
+Notice that the D program moves past the error and continues to run; the system and all observed processes remain unperturbed. You can also add an `ERROR` probe to any script to handle D errors. For details about the DTrace error mechanism, see [ERROR Probe](dtrace_providers_dtrace.md).
 
 ## Pointer and Array Relationship {#dt_ptrarel_dlang}
 
diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
index 0e776867c..1a1549445 100644
--- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
+++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
@@ -390,7 +390,7 @@ Type Name
 16 bytes
 
 </td></tr><tbody></table>
-D also provides the special type `string` to represent ASCII strings. Strings are discussed in more detail in [DTrace String Processing](dtrace-ref-DTraceSupportforStrings.md#).
+D also provides the special type `string` to represent ASCII strings. Strings are discussed in more detail in [DTrace String Processing](dtrace-ref-DTraceSupportforStrings.md).
 
 ## Constants {#dt_consts_dlang}
 
@@ -664,7 +664,7 @@ Arithmetic in D can only be performed on integer operands or on pointers. Arithm
 
 However, the DTrace execution environment does automatically check for and report division by zero errors resulting from improper use of the `/` and `%` operators. If a D program contains an invalid division operation that's detectable at compile time, a compile error is returned and the compilation fails. If the invalid division operation takes place at run time, processing of the current clause is quit, and the `ERROR` probe is activated. If the D program has no clause for the `ERROR` probe, the error is printed and tracing continues. Otherwise, the actions in the clause assigned to the `ERROR` probe are processed. Errors that are detected by DTrace have no effect on other DTrace users or on the OS kernel. You therefore don't need to be concerned about causing any damage if a D program inadvertently contains one of these errors.
 
-In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md#). You can control precedence by grouping expressions in parentheses \(`()`\).
+In addition to these binary operators, the `+` and `-` operators can also be used as unary operators, and these operators have higher precedence than any of the binary arithmetic operators. The order of precedence and associativity properties for all D operators is presented in [Operator Precedence](dtrace-ref-TypesOperatorsandExpressions.md). You can control precedence by grouping expressions in parentheses \(`()`\).
 
 ## Relational Operators {#dt_relatops_dlang}
 
diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
index da2130fa6..bc10071ca 100644
--- a/doc/userguide/reference/dtrace-ref-Variables.md
+++ b/doc/userguide/reference/dtrace-ref-Variables.md
@@ -15,7 +15,7 @@ D provides several variable types: scalar variables, associative arrays, scalar
 
     where *name* is any valid D identifier and *expression* is any value or expression that the variable contains.
 
-    DTrace includes several built-in scalar variables that can be referenced within D programs. The values of these variables are automatically populated by DTrace. See [DTrace Built-in Variable Reference](dtrace_builtin_variable_reference.md#) for a complete list of these variables.
+    DTrace includes several built-in scalar variables that can be referenced within D programs. The values of these variables are automatically populated by DTrace. See [DTrace Built-in Variable Reference](dtrace_builtin_variable_reference.md) for a complete list of these variables.
 
 -   **Associative Arrays**
 
@@ -29,7 +29,7 @@ D provides several variable types: scalar variables, associative arrays, scalar
 
     Where *name* is any valid D identifier, *key* is a comma-separated list of one or more expressions, often as string values, and *expression* is the value that's contained by the array for the specified key.
 
-    The type of each object that's contained in the array is also fixed for all elements in the array. You can use any of the assignment operators that are defined in [Types, Operators, and Expressions](dtrace-ref-TypesOperatorsandExpressions.md#) to change associative array elements, subject to the operand rules defined for each operator. The D compiler produces an appropriate error message if you try an incompatible assignment. You can use any type with an associative array key or value that can be used with a scalar variable.
+    The type of each object that's contained in the array is also fixed for all elements in the array. You can use any of the assignment operators that are defined in [Types, Operators, and Expressions](dtrace-ref-TypesOperatorsandExpressions.md) to change associative array elements, subject to the operand rules defined for each operator. The D compiler produces an appropriate error message if you try an incompatible assignment. You can use any type with an associative array key or value that can be used with a scalar variable.
 
     You can reference values in an associative array by specifying the array name and the appropriate key.
 
diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index 607c8f0dd..28b3001ae 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -325,7 +325,7 @@ The built-in variable `execname` references the name that was passed to `execve(
 fileinfo_t fds[]
 ```
 
-The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md#).
+The built-in `variable fds[]` is an array which has the files the current process has opened in a `fileinfo_t` array, indexed by file descriptor number. See [fileinfo\_t](dtrace_providers_io.md).
 
 ## gid {#dt_ref_var_gid}
 
diff --git a/doc/userguide/reference/dtrace_command_reference.md b/doc/userguide/reference/dtrace_command_reference.md
index 90209d123..2c45d8e4b 100644
--- a/doc/userguide/reference/dtrace_command_reference.md
+++ b/doc/userguide/reference/dtrace_command_reference.md
@@ -3,12 +3,12 @@
 
 The `dtrace` command is a generic front-end utility for the DTrace facility. The command implements an interface to invoke the D language compiler. The `dtrace` command can also retrieve buffered trace data from the DTrace kernel facility and includes a set of basic routines to format and print traced data.
 
--   **[About the dtrace Command](../reference/dtrace_command_desc.md#)**  
+-   **[About the dtrace Command](../reference/dtrace_command_desc.md)**  
 The `dtrace` command provides a generic interface to all the essential services that are provided by the DTrace facility.
--   **[dtrace Command Options](../reference/dtrace_command_options.md#)**  
+-   **[dtrace Command Options](../reference/dtrace_command_options.md)**  
 
--   **[dtrace Command Operands](../reference/dtrace_command_operands.md#)**  
+-   **[dtrace Command Operands](../reference/dtrace_command_operands.md)**  
 
--   **[dtrace Command Exit Status](../reference/dtrace_command_exit_status.md#)**  
+-   **[dtrace Command Exit Status](../reference/dtrace_command_exit_status.md)**  
 
 
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 6fd0fec6e..70fcb583f 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -3,30 +3,30 @@
 
 DTrace exposes different providers that publish probes that are grouped together for particular instrumentation or functionality.
 
--   **[CPC Provider](../reference/dtrace_providers_cpc.md#)**
+-   **[CPC Provider](../reference/dtrace_providers_cpc.md)**
 The CPU performance counter \(`cpc`\) provider makes available probes that are associated with CPU performance counter events.
--   **[DTrace Provider](../reference/dtrace_providers_dtrace.md#)**  
+-   **[DTrace Provider](../reference/dtrace_providers_dtrace.md)**  
 The `dtrace` provider includes several probes that are specific to DTrace itself.
--   **[FBT Provider](../reference/dtrace_providers_fbt.md#)**  
+-   **[FBT Provider](../reference/dtrace_providers_fbt.md)**  
 The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
--   **[IO Provider](../reference/dtrace_providers_io.md#)**
- The `io` provider makes available probes that relate to data input and output.
--   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md#)**
+-   **[IO Provider](../reference/dtrace_providers_io.md)**
+The `io` provider makes available probes that relate to data input and output.
+-   **[Lockstat Provider](../reference/dtrace_providers_lockstat.md)**
 The `lockstat` provider provides probes that can be used to study lock usage and contention.
--   **[Pid Provider](../reference/dtrace_providers_pid.md#)**
+-   **[Pid Provider](../reference/dtrace_providers_pid.md)**
 The `pid` provider traces a user process, both function `entry` and `return`, and an arbitrary instruction.
--   **[Proc Provider](../reference/dtrace_providers_proc.md#)**
+-   **[Proc Provider](../reference/dtrace_providers_proc.md)**
 The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
--   **[Profile Provider](../reference/dtrace_providers_profile.md#)**
+-   **[Profile Provider](../reference/dtrace_providers_profile.md)**
 The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
--   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md#)**  
+-   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md)**  
 The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
--   **[Sched Provider](../reference/dtrace_providers_sched.md#)**
+-   **[Sched Provider](../reference/dtrace_providers_sched.md)**
 The `sched` provider makes available probes related to CPU scheduling.
--   **[SDT Provider](../reference/dtrace_providers_sdt.md#)**  
- The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
--   **[Syscall Provider](../reference/dtrace_providers_syscall.md#)**  
+-   **[SDT Provider](../reference/dtrace_providers_sdt.md)**  
+The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
+-   **[Syscall Provider](../reference/dtrace_providers_syscall.md)**  
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
--   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#)**
+-   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
 Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
 
diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
index 40903775d..6c1fa8ecf 100644
--- a/doc/userguide/reference/dtrace_providers_proc.md
+++ b/doc/userguide/reference/dtrace_providers_proc.md
@@ -130,7 +130,7 @@ No fundamental difference between a process and a thread that a process creates,
 
 ## proc Probe Arguments {#dt_ref_procargs_prov}
 
-The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md#) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
+The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
 
 <table><thead><tr><th>
 
diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
index 68bcdf715..f6d183708 100644
--- a/doc/userguide/reference/dtrace_providers_sched.md
+++ b/doc/userguide/reference/dtrace_providers_sched.md
@@ -245,7 +245,7 @@ Probe
 </td></tr><tbody></table>
 ### lwpsinfo\_t and psinfo\_t {#dt_ref_lwpsinfo_t_psinfo_t_sched_prov}
 
-The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md#).
+The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md).
 
 ### cpuinfo\_t {#dt_ref_cpuinfo_sched_prov}
 
diff --git a/doc/userguide/reference/dtrace_runtime_options.md b/doc/userguide/reference/dtrace_runtime_options.md
index b721f64e6..766709af2 100644
--- a/doc/userguide/reference/dtrace_runtime_options.md
+++ b/doc/userguide/reference/dtrace_runtime_options.md
@@ -5,19 +5,19 @@ DTrace uses reasonable default values and flexible default policies for runtime
 
 Options that can be specified when running the `dtrace` utility can be categorized into three types:
 
--   [Compile-time Options](compiler_options.md#): affect the compilation process but might also affect runtime behavior.
+-   [Compile-time Options](compiler_options.md): affect the compilation process but might also affect runtime behavior.
 
--   [Runtime Options](runtime_options.md#): affect the runtime behavior of DTrace but which are often set at compile time.
+-   [Runtime Options](runtime_options.md): affect the runtime behavior of DTrace but which are often set at compile time.
 
--   [Dynamic Runtime Options](dynamic_runtime_options.md#): affect the runtime behavior of DTrace but which can be changed while tracing, by using the `[setopt](function_setopt.md)` function.
+-   [Dynamic Runtime Options](dynamic_runtime_options.md): affect the runtime behavior of DTrace but which can be changed while tracing, by using the `[setopt](function_setopt.md)` function.
 
 
--   **[Setting DTrace Compile-time and Runtime Options](../reference/setting_dtrace_compiler_and_runtime_options.md#)**  
+-   **[Setting DTrace Compile-time and Runtime Options](../reference/setting_dtrace_compiler_and_runtime_options.md)**  
 You can tune DTrace by setting or enabling a selection of runtime or compiler options. You can set options by either using the `-x` command line switch when running the `dtrace` command, or by specifying `pragma` lines in D programs. If an option takes a value, follow the option name with an equal sign \(`=`\) and the option value.
--   **[Compile-time Options](../reference/compiler_options.md#)**  
+-   **[Compile-time Options](../reference/compiler_options.md)**  
 Compile-time options can control how DTrace programs are compiled into eBPF code that's loaded into kernel space.
--   **[Runtime Options](../reference/runtime_options.md#)**  
+-   **[Runtime Options](../reference/runtime_options.md)**  
 Runtime options can control how the DTrace utility behaves.
--   **[Dynamic Runtime Options](../reference/dynamic_runtime_options.md#)**  
+-   **[Dynamic Runtime Options](../reference/dynamic_runtime_options.md)**  
 Dynamic runtime options are specific to D programs themselves and are likely to change depending on program functionality and requirements.
 
-- 
2.47.3

