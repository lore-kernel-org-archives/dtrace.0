Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E971AC427
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731621696; cv=fail; b=VvAogCQGILDfoPtLrUzx7JnQhg3u9QxFELGOgKmv3jdVjIcGUZj3AseyV9zjA9uab4yaIYp6Qmd36W3TEC4s23pNEYEivJOu2Wacad7/BlCZ8HKwvXURJgxX8hgh9B9XtaJbZBOmOGugv60zohZEYMLvMlkiPEVsMe/HKqsIkBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731621696; c=relaxed/simple;
	bh=/lE3xU+1SuuauxRQAb0VpJsz4NLLmuA37A+tHcfvp8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XBlUpEQZjEku3JyWCQTo2WB2HxQSkGNTZFyZIVZYeptdXLjFSA+fa9ABLmPeNLHSi3UKHGMusc4bPMrFcOW87ili1zmu194SaLAKKe6E3rVKKupg9zAUhjLnDd0t8lY6CrIoiUsSeng8F6IlD5/SZp5H1UqLS6z3Cin2EOQ9gEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VRkQc2Qu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mj6/IZzW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VRkQc2Qu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mj6/IZzW"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AELfadg020976
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=S9XcIYW0ciWw5JijA4NDAhZVdS3v/wilZkx6fwb5miI=; b=
	VRkQc2QuD6icHCubVSxFj57hb3FYC+GhHNpsHmnsolGS+ucqjJzPMgiH+ZrgMBZa
	Kiw/i0Q6+axpHJSeUW/7RY5bN3MW6GbXHEcvKxpMVhoQ+b+XEKb/zTVwaUPZdH8r
	cT4Yey+Fx5jjXQWHwSYOMdUagsGYpOHr9SlUUbf2tKTRkRYo/f/dcs3oEGvtqrQI
	Dg18TLLUQf8jqItgETp6jq1RSzMnzPb1hmQfmxlOfLkseEKNhhLo462RXNDXZJ0W
	D7DESoQ7QgRMRJKcSUxrWPv6FTT5EGasQ6ZKXwvaXTY51TUFup7rZHAfmdQ4VZxI
	2zwHZeehgLyJZGVwCfxzfQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0n529tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AELfnkL035988
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx6bec5g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Nov 2024 22:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxn4EB0Ql0Ian5oAVOWUetXrqeqSO9VMW0N8R/iXVnUoxiEg4wJifbExt+tBZrHHSUROM4mxHflrHkp7Zd+zmE6H2GjI8s+D4LTrZ82fGu+S03tW7EoIXuWDMb+P94D9D8Z2uq+yXNiLilTKm3FOh+t1hwYXMIS0Wt/erT5oCE4UVDL/op823xTxO8Feif7udzvI/nPW+fTAPGdkYbfV6f++f77qdDOosZu+37KP2wsOO8Z9gFMPt8s+y14jmeuxqZ80mtJtIpE9zHTU+hHJ8Ie76SdEx1cOqQOAqUH7J7AzpZNtbm6PIbgkbWpc375+H8wVMJMPq2+QnRxbz5imIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9XcIYW0ciWw5JijA4NDAhZVdS3v/wilZkx6fwb5miI=;
 b=pckysfLfXAouEyMlraqbNBw/UhQzjUpJITepAM0aiHV+B+KRuTkG4IoStDAWelmbQKZO/lsciUIsGQzgqDElW9YCsYhL5NFMIsgsqKQGNQwVIeTjOh04qBrens1Xlan7IFno+imSO0eIDfG40and4iWujD9erE6NQZ1V7CG/BmwMiE9KnElckl4/hvcBV5uj4YfZ9XB373mzYLU0pJ5/4AWp6Fzy1kP4C856efbZxMuHRYOm341TZ4coxUQZ7MLwkT1fwX/1UFevRjncnX4bQE6jQVdu0tt4yRiI8klfRi52j0L9OoC421K5EkffrzNusrfvhR0Lb6htEVRnPu/65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9XcIYW0ciWw5JijA4NDAhZVdS3v/wilZkx6fwb5miI=;
 b=mj6/IZzWCIjai11T+WrVJenrQ5WLXIDsfBAJA0uj6/kkNrTa5hdFsKct3kpctBC5n8LzSpIF8nAzr29YFBs79P5OI9TW1cs5+sxY2B34HjNuv+PoOg9NSAMlCqSOpGRbqinwfW4r78Vig0OUh9QBE8oCuP87OIaSiQuoC2vTLJ0=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MW5PR10MB5873.namprd10.prod.outlook.com (2603:10b6:303:19b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 22:01:20 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 22:01:20 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: eugene.loh@oracle.com
Subject: [PATCH v2 4/4] probe: make it possible to destroy probes in more cases
Date: Thu, 14 Nov 2024 22:01:08 +0000
Message-ID: <20241114220108.95647-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241114220108.95647-1-nick.alcock@oracle.com>
References: <20241114220108.95647-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0593.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::8) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MW5PR10MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac9914a-212c-4dd2-9386-08dd04f7def2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IcMjlU4fXgSheqQAPURUn42MeUgg9skeh5R9RAaX3V+BPN8AQvt36kLaeFej?=
 =?us-ascii?Q?EuOD/RcJpRIYzxycIYgVpXdId7j2tCNzpzcmIPom0rA3ees4bJ0PrilXiIK6?=
 =?us-ascii?Q?XEs4aAH3ILoZTFno5YuDxP6q+4f1wfrn+/z2FAnlntzTi/rF6XU7zcq54Lms?=
 =?us-ascii?Q?u55c2+hX42KXBq75o9eAJTsja4JkcTtqTKfE3ND3exGGzmJeF/f+uQXrekCp?=
 =?us-ascii?Q?Xr3kgRD+Dhe6cpMSV4lqP4mD+NfpbVq7lMzEiwfQUddd28VAbA40Q8fTx58q?=
 =?us-ascii?Q?DOILRnsVvUgD2DOCajLr4MvfjsqCuk4A9W08zVVDCk4aB+rZ+Wa8A51ijxqC?=
 =?us-ascii?Q?mSeCNq+4wrkiioFAD2NJl/PG0X/hUSCex+xkSXMj2fWWqezGAsVIO6RXY1G0?=
 =?us-ascii?Q?6L2bW+pU05L/4yDcdaQ2AzHpxTsumAn9vvYMhylx+/tunZGsTSJFKRFBV+Ma?=
 =?us-ascii?Q?5PLu+ZD2AC2JcS/Ak4YswVj1SRmeZM1v/FCI5rZCbVNFI5sV3kdD5tKWNaBJ?=
 =?us-ascii?Q?yCVyKpW3FkhsQmzlhgiWi6b6iTcyfgTq6E2ROQDba4RG1+oMVlA0nnMej+FT?=
 =?us-ascii?Q?+gP0dGFf5ESjjgQFa84e5x2Fu4oP8jNNMZL1f/Tybq/bs06wuS2560bmih9o?=
 =?us-ascii?Q?3wtWHo7KYIbC794aFJb7E8fh5J7e2W4OIyFc2CyB9vDvlzGLSBjdEoiEKJTA?=
 =?us-ascii?Q?Pnz85hj8FzpSES0pvgQe1J6jmCBFa0H4xLpLFEX98C3VJwLDo2dIhYNzd6Wb?=
 =?us-ascii?Q?WkPay0kiY7CKOzs7aK5MoA2yTzgJu9C4gPKmN6h7+NYmJty1yIt5m6ci78YL?=
 =?us-ascii?Q?TbGGSNglON4d40wRM2qOIeK8WL+O71PqyyyRN7i8YYo0//JPiQNCbOzljoqV?=
 =?us-ascii?Q?Xx0jeJhQB1BHDg7RXUcU26vvStQKEeIMOL5SA2fwW0MbOpodiMLeNz4QI2w1?=
 =?us-ascii?Q?FE3UJ8qEvACyHWcv2WBQy2nMXZPGMnM+r1by9Hf6yRb0c4TjIE5jIjY4SGUN?=
 =?us-ascii?Q?H5+Qt/5c2VatZLukkBPx+PCJ4BOeCo+DrGw2Dg9k21b4dGQwXpn/jzYuR5hI?=
 =?us-ascii?Q?h+jjDi1hsLlhlBaweeLf8eVqBxTctcvAmc2uH9Zpo1Y1Q5l1jBHRZp3hJ6tM?=
 =?us-ascii?Q?g/VCRbaKkZ3RoQHxhurylj+zh/pOTnWWFvlx3R2Kgp58DKv94vifk+9gJBjG?=
 =?us-ascii?Q?MGp9G3AQfB++8azDTlbrE2Gjv4xikQJ6f34jJpKv3sZT5O7oR2129uRSU+nE?=
 =?us-ascii?Q?HyjPrQ+Pj2RcQE/R3DnPdnLwQZ7lIrmnxcdGHiFRHoOFY/airtD/Tt3Eqfj2?=
 =?us-ascii?Q?hdsas9NqAZDTLbFPBpOfYj4O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uGwKipMDy9aTTRmYEwW4RIO9mFCW0ETGuXNh0zTeH+YBVARe3oSdGBIM0a4L?=
 =?us-ascii?Q?kXMhUj+2DPnXPcOha9g7IdzQu7at0Zu44jITjk4u6eKyo8bR/LglM9U0L3gG?=
 =?us-ascii?Q?u59oVXL/LUuDqpOOnscm1xhArbY6jBbtydA/JTOUFZuJW2o520L56CbsgD4f?=
 =?us-ascii?Q?ZF5OI89RqJZmC8PLajXSdSNTKPaY+cJF8occqp5zlPDEVzTQqEn8mWQPEVhn?=
 =?us-ascii?Q?ZSKiJt38jizuiFtTa3OsOqlHYXRbIHtyAfxxP88fHZKsLg+3hpmhtkhnBcOE?=
 =?us-ascii?Q?x5UZIAS8SeToZ9P3bwVL1DjaFFdWxEpiKoe/8gH/IynFFp49VbyJBhitlKvN?=
 =?us-ascii?Q?SU1XUUIBmeS2QB/FN8SV7VZhKsyOafa8C8itSahM7nNStJH0jHp5fx0+Jmhf?=
 =?us-ascii?Q?fe72lDxYuYdISYx9+8kz9GppnE5dQSakGlP3mZDBgmnuB/8G2UFfp7lEmKhH?=
 =?us-ascii?Q?hhMqL5fTUIX0edyCyf2MCXm7/ngntM7yQ+XDFgOKO9BYim47qHd7SAp8Xgnb?=
 =?us-ascii?Q?tefkb2iDk2MFo4b+6lhRZZR/rMG86kLmMjBjTMsl7TPj/ydIWNa+hUXl22cu?=
 =?us-ascii?Q?4eeTuwZlXSL6Y/ARwvWVGKlMrlESADgWcN+MUgrovMJdWOUaEiZ5ik7TD2up?=
 =?us-ascii?Q?HigvEenJkAjQfNjREGK8Qy3fI+QdpH2KRFoh5t7hHedvWBozMYVLLyna+b7K?=
 =?us-ascii?Q?mmzCeUPtC3J2hIUWiBiNfhCO15kp2/lFZRQfoLBP/+LPu/dvHJv85iYwx5Tu?=
 =?us-ascii?Q?eIADuqjaZ0KbcnyfTFb/pT3S5v5njZWEkUXtZeEWtR6nhT4IN/kDomHOa7Lj?=
 =?us-ascii?Q?QmRMMbLZYInPDNbjnvSbVnUT83wcbHd4/zInVY/PY/tpJJE58wdpF0GsXexN?=
 =?us-ascii?Q?O+UfNiCcqIjb3zMbsgtNu4jA7qpvA+37NiVoo3D7m6CNb5Hd8oxEoDWCkm9d?=
 =?us-ascii?Q?HV1bnp0gaQP7Keq2eSdcsOJHZ/b95nH6RrdXmtqUZltAhzJ8YSzWIKTjIvsd?=
 =?us-ascii?Q?rjDxjMp1ml89rWnBkfsTXnoVBtVGJF7zH9dkZbMutYRkjJbKdqTc2T/W+4AB?=
 =?us-ascii?Q?Sq+WUnMzdxC5i1BPzjVGQuyrXOk8/4SPOrzvHScBTRXT+QWAcmm4eatvDO2f?=
 =?us-ascii?Q?o5J9IXrWTySrXSA04mpVm3LUrwPN8B7YcF7ThbpCO0TuvYxFR4XBPidKgipE?=
 =?us-ascii?Q?AGEpTg1lLds6pBYVSTSmutxnyNKyp5UfIrImFIEU38agqUhrVFXF6dvC+iwx?=
 =?us-ascii?Q?tZ/XO9yOcM5CtmH+7uryIeIqQyvLFtqQlZIoLT0kLOdlBP5wInjkHP9DomUK?=
 =?us-ascii?Q?myS65vndY3U6AylUFuIPlyggCwiQjiriQYAaGikvabfnfyXTdQBSZhJfM8w7?=
 =?us-ascii?Q?39SosPAeLaUJPVF7QLdGR2aUWS83lvHGNrqXicm61meyGYKxk/IuLOLxwSVK?=
 =?us-ascii?Q?VPv/8RRi+LVa74oVjKbrXjsx6G5BC8YqcMT8Z6msi9vZADNXYpKrpCaLfsOf?=
 =?us-ascii?Q?ghWjkEEbWHdjlkO0caqDcvsjVU2smrQxxl8l9o1N3NhVvSQSwW3m4XI1SvTv?=
 =?us-ascii?Q?cptOyO8WT+gaeVrRLUvM4IFNgJzXoERKgT4tTJYMMSge4UrGmW5eX5IOIFKc?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p6NaneTkpa81gncFUyux2U/r4yx3U2AYXKKO8o8sJDYR0zZaxAI9QhQbv6E7YkFr8XlTO56BRN3Ah23DckmZNsghCC6/bjuECLoi6D2wTIku8HJ4B8Iz2LgE3YuzdYYnZqBjIS7yIsGa6DnJksIDEngQL0/Gmbo2zaTFYZ0u7Wp08ETznntUP0pZp2z6tSNdDXHlWUJmqxajUQdUDiFOVOu5LQg/F9i1BXOWVFqkpIjNdYRmh6nbdtSndPb9PlOPJVcRhDwoYI3aZd2PwFJQR1pDk2tYl0O5IjDtPUxJZ4niBpU3sYuOKKLVHtFcHu/+a2hAzz/CyjAP9CEtXS5x2YcLIPSBJMJ492dDud+BMKMz6pD3tD0xTMhIITqKo0yvkRZ2Mp4d0BTt6OKcHt6s1O5CDsa3gChzTm0aCT0Qu/vm0Y7XPoHNOfPjvSL0gB1qhPaLgOCX2FsAX/uUPxLYHYBthd56DF6HSpSDhQY0yHybxcd6tRpeR4g/cid/RRiRRjELA9pn6vyKCCPpRjdsGgCNBJeNgqYfhNckuHW5r+YXCBzD+j2GFJt7et3K2P6K+NUCpJGR8cd2/B2xCFyDcg1MMQFBBRbVdMZNUj2dBMk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac9914a-212c-4dd2-9386-08dd04f7def2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 22:01:20.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SD5kBDpGdlZTNtRaS/TIdZ9P4X9aelwfAafPzfPsk39f7OU8d2FNRWhnCHzlbFprMuPK6/LaVZtnvFK+1gmCow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5873
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411140173
X-Proofpoint-ORIG-GUID: GgL4yACdZFfyZv_RZaSsZ04hHxYhD5wQ
X-Proofpoint-GUID: GgL4yACdZFfyZv_RZaSsZ04hHxYhD5wQ

In particular, when the parser has failed (so we have no yypcb)
but we have successfully defined some interface-only probes but
not yet cooked them (so we have no provimpl), we can find that
*both* our sources for a dtp in dt_probe_destroy are unavailable.

Make one available in the dt_probe_t as well.

The test in this commit provides a .d like this:

provider prova { probe entrya(); };
provider provb { probe entryb(); probe entryc(int, char *) : (char *, int); };

prova is defined but not cooked because parsing failed in provb, so we get
this crash when trying to do final cleanup of prova, long after the parser is
gone:

1  0x00007ffff7cf408a in dt_iddtor_probe (idp=0x3cee000) at libdtrace/dt_ident.c:542
2  0x00007ffff7cf4d5a in dt_ident_destroy (idp=0x3cee000) at libdtrace/dt_ident.c:964
3  0x00007ffff7d0c226 in dt_node_free (dnp=0x21e05b0) at libdtrace/dt_parser.c:571
4  0x00007ffff7d17748 in dt_node_list_free (pnp=0x3cee1b8) at libdtrace/dt_parser.c:4851
5  0x00007ffff7d0c460 in dt_node_free (dnp=0x3cee180) at libdtrace/dt_parser.c:643
6  0x00007ffff7d177ab in dt_node_link_free (pnp=0x3cee278) at libdtrace/dt_parser.c:4865
7  0x00007ffff7d3df8b in dt_provider_del_prov (head=0x0, pvp=0x3cee1f0) at libdtrace/dt_provider.c:74
8  0x00007ffff7cf1d32 in dt_htab_destroy (dtp=0x53eb20, htab=0x187a8a0) at libdtrace/dt_htab.c:108
9  0x00007ffff7d0842e in dtrace_close (dtp=0x53eb20) at libdtrace/dt_open.c:1306
10 0x0000000000403f8e in dfatal (fmt=0x4d6a45 "failed to compile script %s") at cmd/dtrace.c:194
11 0x0000000000404b9b in compile_file (dcp=0x536990) at cmd/dtrace.c:480
12 0x00000000004073c9 in main (argc=8, argv=0x7fffffffe788) at cmd/dtrace.c:1351

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_probe.c                          | 14 +++-----
 libdtrace/dt_probe.h                          |  1 +
 .../unittest/usdt/err.argmap-name-required.sh | 34 +++++++++++++++++++
 3 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100755 test/unittest/usdt/err.argmap-name-required.sh

diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index ccaa3081c5b23..31c78d6d987e1 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -140,8 +140,7 @@ alloc_arg_nodes(dtrace_hdl_t *dtp, dt_provider_t *pvp, int argc)
 static void
 dt_probe_alloc_args(dt_probe_t *prp, int nargc, int xargc)
 {
-	dt_provider_t	*pvp = prp->prov;
-	dtrace_hdl_t	*dtp = pvp->pv_hdl;
+	dtrace_hdl_t	*dtp = prp->dtp;
 	dt_node_t	*nargs = NULL, *xargs = NULL;
 	int		i;
 
@@ -252,6 +251,7 @@ dt_probe_create(dtrace_hdl_t *dtp, dt_ident_t *idp, int protoc,
 	prp->pr_inst = NULL;
 	prp->argv = dt_calloc(dtp, xargc, sizeof(dtrace_typeinfo_t));
 	prp->argc = xargc;
+	prp->dtp = dtp;
 
 	if ((prp->nargc != 0 && prp->nargv == NULL) ||
 	    (prp->xargc != 0 && prp->xargv == NULL) ||
@@ -323,12 +323,7 @@ dt_probe_destroy(dt_probe_t *prp)
 	dt_probe_stmt_t		*psp, *psp_next;
 	dt_probe_instance_t	*pip, *pip_next;
 	dt_probe_dependent_t	*dep, *dep_next;
-	dtrace_hdl_t		*dtp;
-
-	if (prp->prov != NULL)
-		dtp = prp->prov->pv_hdl;
-	else
-		dtp = yypcb->pcb_hdl;
+	dtrace_hdl_t		*dtp = prp->dtp;
 
 	if (prp->difo)
 		dt_difo_free(dtp, prp->difo);
@@ -473,7 +468,7 @@ dt_probe_define(dt_provider_t *pvp, dt_probe_t *prp, const char *fname,
 dt_node_t *
 dt_probe_tag(dt_probe_t *prp, uint_t argn, dt_node_t *dnp)
 {
-	dtrace_hdl_t *dtp = prp->prov->pv_hdl;
+	dtrace_hdl_t *dtp = prp->dtp;
 	dtrace_typeinfo_t dtt;
 	size_t len;
 	char *tag;
@@ -557,6 +552,7 @@ dt_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
 	prp->prov = prov;
 	prp->prv_data = datap;
 	prp->argc = -1;
+	prp->dtp = dtp;
 
 	dt_htab_insert(dtp->dt_byprv, prp);
 	dt_htab_insert(dtp->dt_bymod, prp);
diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index 2a78cb9ca4dae..da7a341354225 100644
--- a/libdtrace/dt_probe.h
+++ b/libdtrace/dt_probe.h
@@ -55,6 +55,7 @@ typedef struct dt_probe {
 	int argc;			/* output argument count */
 	dt_probe_instance_t *pr_inst;	/* list of functions and offsets */
 	dtrace_difo_t *difo;		/* BPF probe program */
+	dtrace_hdl_t *dtp;		/* pointer to containing dtrace_hdl */
 } dt_probe_t;
 
 extern dt_probe_t *dt_probe_lookup2(dt_provider_t *, const char *);
diff --git a/test/unittest/usdt/err.argmap-name-required.sh b/test/unittest/usdt/err.argmap-name-required.sh
new file mode 100755
index 0000000000000..3fdefb8130ac7
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-name-required.sh
@@ -0,0 +1,34 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Make sure we get the right error when mappings are defined with no
+# argument.
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS="$test_cppflags"
+LDFLAGS="$test_ldflags"
+
+DIRNAME="$tmpdir/argmap-name-required.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# We define multiple probes here to verify the absence of a potential error
+# where parser failures when previous probes have been successfully defined
+# causes crashes due to problems freeing still-uncooked probes.
+
+cat > prov.d <<EOF
+provider prova { probe entrya(); };
+provider provb { probe entryb(); probe entryc(int, char *) : (char *, int); };
+EOF
+
+exec $dtrace $dt_flags -h -s prov.d
-- 
2.46.0.278.g36e3a12567

