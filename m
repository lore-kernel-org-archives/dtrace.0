Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793402824;
	b=rHrPbD5cOyPn2/7lg+mYrtUSFhFl5fpUgPJm7WX/cyOslszLfA+EC1W6U41w/v9wG1Ef
	 u+R/QUpXdDBOMnYpEpTuNjJWj80gUtTQEFagF3QolzYhXI6SbFEnNuoWdNqsSJQKgFuk5
	 2KOLOv4aFmJ+H9GbiHhNgXuECwDtj96h2A/m9kQKujR47wCPLYE4nPdKJY2sicgOEl7hM
	 n5h9ZmslBIwkIE5gBc4nhKRQ88rVDIDp4zQ9DbU2Dp/gFSf8yQ5Uiot3npLUaYlsfGVff
	 LXt3SsmqcsLQzHrnsq+BEkjiKEFxSmTymSJirSQqEZVUvlKH4EZplgpZAwo2eXBooLw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793402824;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-PublicTrafficType:client-request-id:request-id:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=7QS6VBpLHL6Dx9drkHpt2HVl4nZMP95wFop5+LaO3i0=;
	b=IXhR+cFRH8g/pdqmxGqi6gC5wy1oyuDuUuwFE8Oc2IF9PZ+Uv03V9Wo0d7oofkWcZ9Y/
	 LiGDQzrCfab09RL575hHu0NIGTfIfY4ZXda12h1YRl9mv/rOmUfYDclfygQvQ199FdAtR
	 b2xiwvsTsLrfBtq53ovvzbW3s3qWnGieupAH+9W71LrC6Hx/HL4j/6Oln8jSwR3eivzzD
	 rRLaxRgtBB6zca6dBobB/wuVW1tjHPO9uFUy0wRidQkALlQST96YZnmDQx4YXriWuVp0+
	 phNBeYnsNNLadwBIZBgu2yjT/S/oUtH68XEXA7/m8f9OyxQNGhWQllXUdcrRcRXIEpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=T2QXxV+M;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jq2agsAE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98190606A31C
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 23:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98190606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=T2QXxV+M;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=jq2agsAE
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UL8xPH429524;
	Fri, 30 Oct 2026 23:26:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=7QS6VBpLHL6Dx9drkH
	pt2HVl4nZMP95wFop5+LaO3i0=; b=T2QXxV+MCKeJmAwnAuC6NgoTUAj4rwAeb8
	TZ5Gly4LmSLWqET+pa38V2do6zFOzy6jMd/hLkeZWhvP7rtdSk4KVZUk/4P+4gUd
	B10uOPewFp6AzTtRFgBel53ZEx5E6j5/f8I+GGXgHA3CDDiawy9jcVAuMvXeUBux
	Kksnyb2MQIuUHtAb+Yun7z01cZ59H28che+3Etcjph+YWPTGFRKkZ7GL3LhxSVv+
	+Aa9Y+rSQDtP5o7iNDzRpdW7c9JjUlyVYezE4fLDqa9ewX9RQZ+ZaDMW3e4WZIw3
	B40+Ix1AdMxhW67ruHhX2EMTZlfr4767Zb0SRsWgkgv8nppDIiqA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hn2w5030f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 30 Oct 2026 23:26:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULw7WC1009984;
	Fri, 30 Oct 2026 23:26:55 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hn2waantt-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Fri, 30 Oct 2026 23:26:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTYAMVfEk/yn4e2EXfgma4MKoNxgxBGKn5MEKxhyuAmdPxIl5PTgObYH26iP1L6+PP4wr4omV+ev/Km2k0WzR3hOjwRmhn1EHe4NMzDKuR01gEHTRCqG+AN26ynMDE1uT/SOUw4KNF6ZMbiStdMyyeKMI7obHndsH5VHj5ribhZ6M6EDHJRVfnH6+M9ZbhKbHl9xLTT4AT5x4uVQk/1uQPHTcne/dff6vEK3rhwnR3OL45jpBYsRH9f5qDFdveOjxii1bgj+UwgSpgeDwQiC8SfYvD/TnplRh3h96EG16UT3Fg6CFesbm91i9rGYBT2/Y/2L4K566XdmqXSg+OhMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QS6VBpLHL6Dx9drkHpt2HVl4nZMP95wFop5+LaO3i0=;
 b=JcdPt72zBjbWQQJQ/UUJIQyzXzWPunMHigwRlxuYqGVSfrXJF7K2ynNM7aAdLJa8zH3/POgNtlqHl+UCdzHZMGtfxbJVM0p/LASM8Q02ujp8Y5oHtYkCtDsZyWuApTjk9W+nfADR2TDE+FxjkC9LLYOvMH3yTfYX51UVxer4oETcUa/k95sU1ND1Ohrjpm0neVGYekZH/AZMtP+AAScn/6EaeygmZIclmplbI83MtUb0U0S2PJppbe3cOpk33QjuArS5vtAmpxzppqSdSF5OmACORncKyUhshk3q/ZnWVm12+YgHJa7xDLmQPzxL4C9JOsRDZfUenn66Fcm+aqBvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QS6VBpLHL6Dx9drkHpt2HVl4nZMP95wFop5+LaO3i0=;
 b=jq2agsAEjU+vrCevA7IIvV4WWbClhTr/i6NaRrniQAXQroi2V5pIGRvqr6kcaPXJHdB/LSrkHcvH6M2h8C6W1L0xRJ45M00aAOm7GT3YsQA6aKfXfJxqojhPqWfTZATGV7zRojBcDGcYS7IuFReXhlgkJIFxs5wp7vfOQEwpWa4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BLAPR10MB5187.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 23:26:52 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 23:26:51 +0000
Date: Fri, 30 Oct 2026 19:26:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: ealmorshdy@d-matrix.ai
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 0/3] Fix strlen() overwriting strtab's read-only data and
 zeros
Message-ID: <auUnt_vPhbt120Jb@oracle.com>
References: <20261018-bug010-strlen-strtab-v1-0-ac5f5bc6f8a0@d-matrix.ai>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-bug010-strlen-strtab-v1-0-ac5f5bc6f8a0@d-matrix.ai>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BLAPR10MB5187:EE_
X-MS-PublicTrafficType: Email
client-request-id: e7448eac-b3c6-4483-ae78-d2360d28c508
request-id: cea88a8e-5715-4481-97ad-08df36dd4645
X-MS-Office365-Filtering-Correlation-Id: cea88a8e-5715-4481-97ad-08df36dd4645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|261021121427099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|10067099003|56012099006|261009223027099003|261009221227099003|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YjiQ2e3ZHIxFMv656NWUoT4fsC9qlxXJb9NAIKJkhfHEJPIJ/bfOvOKgWfM7d6AMZTZ3IdoGiMFvfkTXwO6tN436ReRkAiucaXyZKyQesL3oTBlqvhPsuGvFMncjZqy1WaCsHbjq1NxTASe0qxYUSYLN3GqJhYZ6Erm1BvzNl1AbW9I8RkTlKSs+uVoK4qte2teF24m6faT51fr9W+3xfQz6anRrvl8WeCQhfNG0b+PhkBiGtJulQ3y+wqUD5VqZO779ly6kv2W6+mgkc1BBaASVTKG5kcdAACfwDK5HwCrGRMSZkoaFIhAm4qN6IW1sBAAMfwJs4x1GxWTDMXV8r44Cb1gbQseDBwPvq3it4E+lyeuEYi8vzff18DwrGy1pn/SrfLbVRlWKYjHIv5He9l6Nlm6wwscsQH1+k5RwVDt+vO2/ZFfJNCUfoQODJh3neiRi2w5wq3Mw+HlY/b8rvaFMH0STXF1KykjGEhKRvMl808Kf/z3koVjEWPEVNk54tZwBEgSqyEwzkf2UStKpadpOB9rZ+NYdJlw+B/9wNloahGkTogGXe6OIblxp1veqrVeCowc44LBKqgfPlwu593XKfY/UIjngdwOZygcek92y9GU1fXfJlaSGHewBMqgE8r3EqO6VKPJqvsv5QPzaVM2MAEuCW020BnDw5PSMVvg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261021121427099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(261009223027099003)(261009221227099003)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OimoJpo9TF2hwiQorG1csBKtDGH40EsCv+6a5p4XQSpIWaSUa+XP0ibo0gC3?=
 =?us-ascii?Q?TkIi0bKQirMXvaZgow0XZJ41wyzHqn0qXfNuArdx6Wuk+h7AgBHflzqSlYVu?=
 =?us-ascii?Q?Gk52sVuFtRq2rvSV/3A7GXWBFz2b46hlJgUqp2zOhsjzGAEvB9tr0h5IneSv?=
 =?us-ascii?Q?DCG9FqwAymGTE1Oo5N4h12ztwlG/1l6w2I/ev3ftQMaMoPmfXnmO9BoHhZQu?=
 =?us-ascii?Q?6B2RrNuaiuz0rs0iUrU6AP/U2oJeLM+q9NHyprsQGksaUjec89e4XvIGOtDu?=
 =?us-ascii?Q?SpGu8glMLhqkXQxVXe977XjampKNQWlTjEQtsLMuViSgHP/jzIZliQrAB3Yn?=
 =?us-ascii?Q?dEnw76qazCB0qkeEmOQ14w8mSsZf4oauOYjLPPmRNerCwviIwineR1C8SL4d?=
 =?us-ascii?Q?ylFCrOOYPIkpxLIn9D3whbdltmHFvFGd0kydcXmxBYAHyGO2nLkOfIEhWV8r?=
 =?us-ascii?Q?CnB51yO9re56F/jS8YxncOUaynBKg62d8u5z0ofj+xzL2vCoCIVVzMDWZYLV?=
 =?us-ascii?Q?BY2kKxiAV+XAIJYnzOKRP/B/rl3CVHWfQ9DfZR9StuVFTm5BZo6U+0mx5/39?=
 =?us-ascii?Q?YTczN4qjf9lUPuQMuyHNfZYmby5OFWP6iJgBvAyIMletm7vIXa4pzqwnHBlG?=
 =?us-ascii?Q?GWMJWPREpV+wa9aPIECUU9Ulmb2jtuiSBrg0k60veevR+OsUUkfIOd/+GV7x?=
 =?us-ascii?Q?yyVNcLgxAxPZ0vhJxPcnQp+vjqWD5Qs49arUOjWoQJNw2ZSh0wL5xfWDQZBn?=
 =?us-ascii?Q?XZRkIbH487CeHPsdoPa+gff8nmiNaaO9HlUJCtIuQzP8RSVHuAItmFxQfnbu?=
 =?us-ascii?Q?sJy4LLU8gNTWZsbd9UHbRnlFrPhitInXsAD1Z2GD9FYGJsU8ApGxroUOfdR9?=
 =?us-ascii?Q?HVyFt+RckCX2S0DfBPrX13LvW9JzR9u+iad5uNSDpg/UQYvgoBMLGRXI/XDg?=
 =?us-ascii?Q?hjLMaMQT9ffY7kMObWzZyDtg5rh5HPUFVJSlYn212ByfK5wLRWecWHkA2nlS?=
 =?us-ascii?Q?mFCPxAKK4WnGMCC7rBVqJN5UcNVQs8veS3MQiWnD300/21cWmFNcfzX6MbXG?=
 =?us-ascii?Q?rJveznz95IWiuPrrYHepNIq4wCHMjseVPlc3/aCc6XVB+v+p58L1aMu+XNWp?=
 =?us-ascii?Q?+sQ9ZHiau3cs9xMKI4HEeRzlpvfViSkLjGJJW6mw4/t0HXQ+63mKiO606aMC?=
 =?us-ascii?Q?Ca6ttrrMzMJ5Ug4BoLgPtXolySgUCtzZ8rebKy3ysq1nTOF5Q5aUER9RCS0b?=
 =?us-ascii?Q?KArzTJQyuZE9ZRfQSy17Dd2pqo82H2C9bc3568lhKAeJpQrw9xp1ywu5qv9M?=
 =?us-ascii?Q?krporJu5ogph3/el87GzAxP5qXHxk9B+Dd8PbplZfPtYN1oJY3UWiCs+MkPO?=
 =?us-ascii?Q?9uQX0nw6eMpb18hcL+RExjkjwXMY2CBl+2kAJDO1YJWe9g1aHBZPzOEA9zmZ?=
 =?us-ascii?Q?dus/dTwBTWGXLF2SHMTjdLucRGP2XuatZosUczfmSCILrHO5+VvFQ1bBm8Wu?=
 =?us-ascii?Q?dIjw7koPydWj2rxOKHF3FNPsGCaHZNSEuspJqCKbASo8y4B01qXzodux1noi?=
 =?us-ascii?Q?RCTt6WHKcR35H3JgCvcP8SoXNTtsh8FPq2oSvG+1TEWSZ/0QAgcv3mzny0UJ?=
 =?us-ascii?Q?nmUEFLARmI4C/mpszasEAmTaqhkEoA+AhFz6MpK8ebaVK06Si3NRaupOw2hv?=
 =?us-ascii?Q?lEAtMTNANNPoBcIZ8sItMcH4QRo1MA2tQwQQu++1YZFTr1dEAEyKgpbMcME+?=
 =?us-ascii?Q?2el7H3r+Pw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	OC7teluxfcLLJh1HIhNDcGRZanUn6RQtmBdYxL0CwkP7Op3SwkK9EVYGJuqjwnO/8WzEK99F2zxY/pb/QdnaImXX1wBsotWBznuT9dvwNG6z+nMDzLba0RAj/RqisyM2NcWOHGMZ5CMwClMropEZNuUJ880fJX3J+QVLI7TFaWYmKCY2CRl+kpiApqgL0Hu4kpD8CzrO+lw21el+IMIr7TxNgRXXuJYgUoaDSRPNeZ0R7tvVwTo7CvYr+dG5SiEGVjs5MPdUdJNGsxqxl5GpwaYD4uWgzh2FKuyLGItxGrXQgVdJHAjsVDThcK1jgTQROvXU8wQhaxpl83IqChu6DQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b7adjuxPeAPWR5xW3VEc058mvZFAdvQ6gBI0DjCuz44F8fT7hFYmhSZWyMUP1TK8TIaY+QZ3LrgdPis2tIhnC90Bzu3hMZf0zeL3bkRmaZvl6RYUlCegSk4LHawX+6YNeF6uPPg1AbXeSSisStN0GEM1S33PEtAciq78W8KERsaXmirwKtRo8ve86p6NBFvrDVd0OLFdPzdjpb5fpiIOdH3wfok19xFfb9e2r8wYppsa27cC+QIZq1sGoBUSifxUXHyZxabU1M3bgjVWJuIjWy78IT+iEzrXQBjQPvfB4L0Qk4nI0kAPNeSgEzN2ZImHNUVG3lERoKcHpk2gk1xRZTmJ9TOjgUEKsY01DvzRGrh7IuPS4Gmq0sTBu+iGRTj6ZR9yGZy6nsmbu7S8EEqYk9Ft1qD9mxCVPY2cfrguP6rxjHu0crkpE3l8NI9zcyqJpii3sbPefy1FgRpMfpbrgccAjxrdG7MeJrcbeZ9GVfDVOX5ZFccKB+LmVdvtikMWCj01QTXVQ3z/UeQML6wD4cvcTLhCeblKjf838rnScSTm0qAkS1jgU6e1d86EXGw6eGk81gop2BrT435cBWQ1dFYZt/dkDJJiMTkPe6+ByPs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea88a8e-5715-4481-97ad-08df36dd4645
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 23:26:51.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDGg3UhLB4DOEE/BN2GRvHGGb5Nj1bLLZiWIPrxL5kesY0nL8D0V6WWfSrPYzRe1xS4v4DDYbODnSDbygZ/i+MLAH/8l353aDKxmRgKQV9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300093
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6ae527c0 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=JZylk504NbsxK2GvSZsA:9
 a=CjuIK1q_8ugA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-ORIG-GUID: qyIf4KNC6SaTDf_TBVrDgVnv7S9oshsH
X-Proofpoint-GUID: qyIf4KNC6SaTDf_TBVrDgVnv7S9oshsH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MyBTYWx0ZWRfX7/Cf3HlFWYvM
 khKnEGldnrRNq7uIp+NW8uBgTRHZDHHaQYIgiThPKkZ/8ySprl1gDdOMTYpldumlOak4aX4zFa6
 bU9XwelQZ4aodQ2oH8eP0NSe0cqVfrJTU0+djl3bnDroyk8jxD3ghmfTcEm5fVfd9yJxJBMyckP
 uIz0Cw51ZkENnMZ8ZCOEajPFcsMEyPKdhVTigNYBXPLo8cVcoIY+n0Mu6UdCuQaZ8qHrCtVef0N
 oYWVN/Hv2Z5qJACzadyhxUlEF+2f/JqIIaTd8wiDTCr+ruwOSEdLOmw6VLIpema04UzhHOVTYBs
 W6A9rFLZ7uYCY13nbDWIZzWno9uUurU/tnhLBUzHTzoyVkz0y6ErOfbP33C+3w/A0tzUKo8bhpb
 2qm8gnpdEOrOJ/fmpKgWleW9DxK3blWsm5rcpmvSgpmfdmzlRcVlqbD+NSU1OpjxxQ4u/wsxzgZ
 64L4Av6QMOFn2H6d6lA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA5MyBTYWx0ZWRfX9eTOSkY6UJcn
 dmxx73jWyhaeDAcZ7nFO0b8rY1T7FvOqVmyu+GD5O1SmrUgFHTd4kWPv0jn6HsgzgU9DFcARBgr
 LcW+8LPcvlFHGY3PpnXVBqVcKHleuNODaAxCD1HLpfM1mo/p1rCx

Hi,

Just a quick message that I am reviewing your patches.  Thank you so much for
posting them.  You definitely identified some genuine bugs and propose very
good solutions for fixing them.  I really appreciate your contributing to
DTrace.

Please use the dtrace@lists.linux.dev list going forward for all patches and
correspondence, as we are using that one as the primary public mailing list
for DTrace.

Thanks,
Kris

On Sun, Oct 18, 2026 at 02:50:06AM +0000, Eslam Almorshdy via B4 Relay wrote:
> strlen() copies its argument to the end of the string table in the
> strtab map, which is where the block of zeros and the read-only data
> have lived since commits d9d862b6 and e11098e2.  So strlen() of
> anything longer than a few characters overwrites them for the rest of
> the session:
> 
>   # dtrace -qn 'BEGIN { @[strlen("yyyyyyyyyyyyyyyyyyyyyyyyyyy")] =
>                         count(); exit(0); }'
> 
>                  27 8753160913407277434
> 
> Patch 1 has the history and the other effects.  Patch 3 is hardening
> and can be dropped: after patch 1 no BPF code writes to strtab, and
> patch 3 has the verifier enforce that.
> 
> Giving strlen() its own space back is a one-line alternative:
> 
> -	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen, 8);
> +	dtp->dt_rooffset = P2ROUNDUP(dtp->dt_strlen + strsize + 1, 8);
> 
> I chose the temporary string because it leaves strtab with no BPF
> writer, which patch 3 relies on, and because with the one-liner all
> CPUs write the same scratch bytes.  With 8 threads calling getppid()
> under a clause doing four strlen() of 255 bytes, the one-liner ran at
> 3.2-3.7M calls/s and patch 1 at 5.4-5.6M (both 1.26M with one thread).
> The cost is one more temporary string held during the call, as
> strchr() does.  Happy to send a v2 with the one-liner if you prefer.
> 
> Tested on devel 61fea621, x86_64, Linux 6.8.  Over funcs/, aggs/,
> assocs/, variables/, printa/, multiaggs/, arrays/, codegen/ and dif/
> (778 tests), the only change from patches 1-2 and 1-3 is the two new
> tests passing.  They also fail without patch 1 and pass with it on
> dev-queue 0e93872f.
> 
> ---
> Eslam Almorshdy (3):
>       Use a temporary string as scratch space for strlen()
>       test: strlen() must not overwrite the rodata or the zeros
>       Create the strtab map read-only for BPF programs
> 
>  bpf/strlen.c                                       |  4 +-
>  libdtrace/dt_bpf.c                                 | 19 ++++++---
>  libdtrace/dt_cg.c                                  | 13 +++++--
>  test/unittest/funcs/strlen/tst.no-clobber-rodata.d | 37 ++++++++++++++++++
>  test/unittest/funcs/strlen/tst.no-clobber-rodata.r |  3 ++
>  test/unittest/funcs/strlen/tst.no-clobber-zeros.d  | 45 ++++++++++++++++++++++
>  test/unittest/funcs/strlen/tst.no-clobber-zeros.r  |  5 +++
>  7 files changed, 114 insertions(+), 12 deletions(-)
> ---
> base-commit: 61fea621160ea4b6302874c62a723da105b44883
> change-id: 20261018-bug010-strlen-strtab-1c4e6c7d2d06
> 
> Best regards,
> --  
> Eslam Almorshdy <ealmorshdy@d-matrix.ai>
> 
