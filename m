Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678481CBA12
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769927; cv=fail; b=O5RX9oe+vgdnbSrMEr2xO4w7rTs3jMsJx6V4h/mdWxxt0yjN+fgGLPFX2ciFxoz6b8Cxhiu3LhsKg/oXzvf/i8lfjZ2bUMXuW47CvNbW0xx6Ejxgn6lXph+FSB/F9fJ1L7ka05tykZVHizVDhu7dLF/ewQhpj3EX68q0lDgnS8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769927; c=relaxed/simple;
	bh=OMBnVe5jE+1+MSk3Yi+dTs1L726CQ+R4M1Y6OBRREuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HiM56x4jUh8XqxE7p1P2YwgmvGlSuDbD/ZrDEuPPUBErZvjjZZPPtANofHbxQO1LprSdhzSDJLQnfZxaBhQzFdnSge/RFH5DnGffCvGf0Zur13URHu3XImZbu6WggHAam9bGbcx2WgOxCNmgPVWYArEMLlo1nOtEcXN6G+SJktA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jix8YDvc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BH5wa/Sr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jix8YDvc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BH5wa/Sr"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2gAkT030658;
	Thu, 24 Oct 2024 11:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Zt41QcD4gBWj2GjdD1wVAznO08gMC2y9k8Q/HIxqulU=; b=
	Jix8YDvcyWg0I9bpgwtY7zy/yiGS53vxAUbvqo8buOwk6T79NC/IbGrw20pwT2RY
	xZ+z+kNFngkXBLtt6B7XzytsbF6VBhWnyuAnit+0D4+Mv1qCXlTr4VdwdSdh0md4
	jM4On/NSBKgGYKWz/hfB/JzZMBeBLsUMTL0LfmzKqvS3Qvd+bLyU/sMAti3jMt81
	WtN3c6kvf5G5fiSJel4eGfoykfPvG8Jzg8ByYFF9+JLQTWc1yfPtd9zhQDBHwxqP
	SNmXHTLVa8WNEiOhGsv/N1QgJeXLsWTogoFNlfoEuGvmlR03NqCX9UL3KRiD8A8F
	1DoaMWSlS9Fz+O3hyVCtRA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asjc11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OB8t8P030951;
	Thu, 24 Oct 2024 11:38:41 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh2tbb2-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/B0s/zrQQna8zAwTXuciwz4WjGH3/sbFw7dIOvMpT3t6sfKW6KAbzVX9gOGTSgLbv3TQyfultQTMqoJxYGxNke67WLeA5Emxz8ZmMDHDNqrRXKupcm5dMcDGzKxMHmxSsRyJQMiNWyrEhGMeRtJJpaRrzaG6B1oGdaNZbeyw0TQO9crtmJYwyVRFH9dqttN7pHL1Si/YZCPdvx1QJr3xz/w9U60xoT1Ow4r5ZcFbpSqqGPWOg0BUNcsg6iSwJdLrNzJy9EwueIdEUXWT5L1alkAeNq4vPgG4tJM+hJPWRK6fReqxITLpZDHSueKfVwd8LNjOLZhS2GYUcYqdexijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zt41QcD4gBWj2GjdD1wVAznO08gMC2y9k8Q/HIxqulU=;
 b=cRjt0aY8MQCjsJmOyfZlNRPTYCv1Db0rQtO4tzeV3SJnTMaELDywYQVkDKb+WV3wa0uGajU00fALVvGuJh6w88bDvUY1zhoR1vmzXGGss0Q7NNgnxWjXqiYNPAsrYWtVFAGKRAzDSSGqJPBe9+JVKN16tIK1odhjCLZB5PajUHKLVNFl0vZg4dRzSwfcfWX5SFmLfm5/CXbEVcqPEXSP8/9KTf/eroT3Up3ObfL+LnyCtzFRN7vpQ/gAk9/mJCydlmPkvktYilSVUbzKJLs+y4r5+yQ1e8nTpEt3QvB2/8LgyTPU/mBEbn1XLQ/XXIlXhBDzVcc2DuoUMFGnx7wLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt41QcD4gBWj2GjdD1wVAznO08gMC2y9k8Q/HIxqulU=;
 b=BH5wa/SryJqlFaMm2w0x/jA82pf+yhPZOA6KKmtvZCyDDTjbfGU+1ghhZs3DigwRz7KkiGg4cmeFdCzyrrf/0+WdC2J/Af8WfTlfp/oTvBFv48C+tMamVKYPRDLspNyomtDZlkcBLJHvOXK0eoUbu32uWL0OnkoQULNk7uaNe0U=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7986.namprd10.prod.outlook.com (2603:10b6:610:1cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 11:38:29 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:29 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 14/14] man: \fP-ize
Date: Thu, 24 Oct 2024 12:37:58 +0100
Message-ID: <20241024113758.182050-15-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0033.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::8) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: f94b4533-09bb-48f7-3a48-08dcf4206174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5N9s+rlcYFVPkmjd1Yw2P+6TcoSTPdPrbXrUcxySt2A764AUofTZx1QpvC2Q?=
 =?us-ascii?Q?ak0P9KGuqvx54t8LLsFGsFyYdZU+U7kee4260FeBu10LIdcvGLOHIvuSJGE4?=
 =?us-ascii?Q?DTBJ0daqDTz0jJWij6SdwiU1/15z/4gzDQfHLfB5dsZ2xxyj1JAEonztcMwC?=
 =?us-ascii?Q?Pmxs+YXTwL8xJhIz991cxRymTZ5jiM0XTFaElrFP4W/8lUIC5hHI7cGFv/UW?=
 =?us-ascii?Q?eLWHuqjalcd6mObU3mI5pgh1qouUulyrMdUbL0VG+u16PE6NiSjumk8M/UQP?=
 =?us-ascii?Q?IJX6kNGPx1UVf2yjZPyDDEDbAroAG5nCyhmiu4/KLxFryWjjp9DPk3ms0lif?=
 =?us-ascii?Q?FbPCLJxsbrw6076uX512JeDrML8A3pMOF32EKXY7ZxO5oQN7ND0L1/gi5Ov3?=
 =?us-ascii?Q?5ra4xGFo4y7qwV8ajU/iUifTaq0w/O2itZycopikHTrKVf8RB5nqQuXb7HB+?=
 =?us-ascii?Q?gD6zsD0DsRzxsPk2rxUmP/R/XldVq6FPgNq5Bj6onL7iYiAXZ1A44xoZjely?=
 =?us-ascii?Q?x/pWIobytB/eHrEs9GPPCR4Y7gR+DJz05IkW2UUYbEaNL1H/xLnjz/IhHMMK?=
 =?us-ascii?Q?uKT6SPBnAnTtLfpt9/4fm01HBdE4BFU7uK9Vgq4AdolbA6iS7MJHbHAwZA8M?=
 =?us-ascii?Q?5YlDOz9y4DPROOdjQjTst2vWgwTFpXOAbFUViiBJOPf7rvjp1Qxr2I5eCUdv?=
 =?us-ascii?Q?8n/rGEcTWcPLmbVawxW8hAILidMPRhFI6cJaHXsa8YqS7316CzRnweaao/Te?=
 =?us-ascii?Q?skemQD3RpLjEYhovMFtYdgDP9Vd5RKiiAr5S5+4NN2x2sS+PpMbhl6Uov1oj?=
 =?us-ascii?Q?1xxttOxEBScAtupFOfoKiWbN3lTIY5387v0iV8JX07cZdB+xYIncp6ZnygFU?=
 =?us-ascii?Q?8et+E1QmNDyrwfVrTllldp5PrzYtwZPApcOOu+qFi34AyKCTrg14i2tLt2SK?=
 =?us-ascii?Q?nW5KUK1zGbXWfJswxhNvd/RqT97hDjHk6hdpe2g1Tms2eySi0Db02koXDI2f?=
 =?us-ascii?Q?fX2oi0FJFmZlxfSY/4P0l/+SAKp5FS+CKaFnBS/hqS3+pRnsQoolNGoCh24e?=
 =?us-ascii?Q?8rLxoJ/xE76ZSd0xQdEFt1e8nYzN7iFO//FpmiBqs0vDrEDXY6QLAwfITYPy?=
 =?us-ascii?Q?h9QlZ11M7r9/e/F0OcsH/074hOFmN3O6HbKv/8L2d15etgWfFLfdExz6AlU5?=
 =?us-ascii?Q?haBSior4iEvCYabNFYmVsuhEdvI6GcWJ0JnWFnoiRs0nr3P8KBP/29oSqa7y?=
 =?us-ascii?Q?sjXOUcDYCvZqUMeRRo33EAOBm+nzUWvi05CmM7KI2Ed6XW+CsU2SjCk/1f80?=
 =?us-ascii?Q?IpZtXciwIXYEDOOXuTG82WM2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Ch9wAfleZeV/JE8c1U9qexfVIIzinYbp4ZD0nU8bIljLSckxyh32j4DcNE7?=
 =?us-ascii?Q?cFcDNKa6DoqVGtguXaQ2aH/Ko73QGR4tA9QS4dzsYlLwuTuEAZGbTL6EBwaA?=
 =?us-ascii?Q?G9X4I1UsGVM628TeD/GKq9Zg+rKrQkQ3VrrnPd1R1ytWtFoMcjkSg/+7DoKO?=
 =?us-ascii?Q?Y0LEEU+EQARu2Y7J7JGj0wDyQUJpxWgZMvhGz9KmXdxXWC2+5qKO6HpjQ8CY?=
 =?us-ascii?Q?sf3MP2m8mBU0W3si89r4W195cdiOGVXg91LHHa2BC3IC12NOrTic/TEE1Nmh?=
 =?us-ascii?Q?zeTOc8AAGsKU4GtiLPpNiMRbx1vcMtHIsWmhnGSTmOxaujK3Mk43leDQh3XP?=
 =?us-ascii?Q?3n8Xm/+hAZwQYqYaYjhF3WS7mBKgDQF/B5N0xchr3oZl9sO7ukgLrLT+D8my?=
 =?us-ascii?Q?8biYECoJ4+d/IUaXR8EIgo68ZzV/lT+Dgc84sr6VWSZrYqYKbcv0PvH1BMrW?=
 =?us-ascii?Q?svDI/13mby19aUcM5rIFt4e4XyTaZJIXbNoi9oJwAwthMhcWQgUitqy8mzSu?=
 =?us-ascii?Q?W3WeJ4xaLSOmUcDA7oHWEVYW9ccaUi/1XgjQDNs51xHb5oxHIhxyngaOETt9?=
 =?us-ascii?Q?NUTgn9djHHdyZecNp2+i+/D/32MaH7eKIHDJudjcLM/PMNqGqRB34l/uNGUs?=
 =?us-ascii?Q?f5kJh2wbv0CYN7BgF2E59sBOyO/h4qKIPef5dwyoakpGHWpaqQM3osnYnTIQ?=
 =?us-ascii?Q?5jOLxICp24ZPoQ0cWlfUHSdH04ZFSf1yIuWSi6sZF0W1cDpQrpBZT/fQtIW7?=
 =?us-ascii?Q?r148KKJIvWh1bRO43zMjSJX4zOBuvEpeRTaPqpAyA1xGbGmT1cv9lc6tzAJg?=
 =?us-ascii?Q?TgWifx1Ue/Lm8oc81vKj7ummA7sehpL1oPzyLclEtCjZthR3KTAeDqS/cegr?=
 =?us-ascii?Q?lmPeX8hk1aFX8iXFOg0caGeCd+ComTU/uhjsOJT0g+pilEjsN3MFWeO/gEGX?=
 =?us-ascii?Q?aGI/LzZdRCcEPRc1GvSZhk+70rZe+vGWVkNcyWzW4I62tQkmVUPbSFZeehCK?=
 =?us-ascii?Q?McDAhqTeiyNM2qd+8xYYwkWk10K1NrHRHxyNpCNL8h+OTlyo7OGvNw3i30cJ?=
 =?us-ascii?Q?TEeNCb476Al8RL4wYcK8Sn/Z/UbcwMmn5G+JayoGi/J374DnKUZOrMIxXQmj?=
 =?us-ascii?Q?JVlTczJV9u4NbhK6TZG6t/ZJ2pyLgC0HIPqqyxM4CgiAHPtatAqYnr+e1z5A?=
 =?us-ascii?Q?WY00rDR4bXHu/KJcqmqFK4ctERm6QR4rM88z1tVFN2M+HQvjalkHOE1ldfXt?=
 =?us-ascii?Q?HuyGutkeM4QOnnyncV0SX5PgY34Dzr+9mZ7ZoRT+bTe4ADlO1DWU2/PzNxa8?=
 =?us-ascii?Q?y454hI9gghNPpYOBPyMmv6nbfp6aMXBNTXwBzhAsGhnFjA5YJIuTrhHPokji?=
 =?us-ascii?Q?MJYvqiZEChMrgtu2tbXLXcRXGmAeDlxcf/3s8y/RvNw88K0CcvRKZEdHuJrI?=
 =?us-ascii?Q?AoQphdActWuuvHGiNNtUYZewx6DyX5ykmSnk2W2MFTQvlIKOma8l3gFBNpyD?=
 =?us-ascii?Q?6m3QT4LDDYew4w6h+E9tsO/+vc3rar2MJ2pp9md7PYvUNjBmbCqjeG+YTixc?=
 =?us-ascii?Q?DZ0/uo+aR7ATYTn2Iys9nJQioB+DMKOHMSgQyMpdPCZB88DqyDBtcHq8rXE8?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZaMo7iXWDLcNVZLm5GIVrmM0edoadGDF5e2dW3MsBI2iRViu1cpBm01gunJVt33uqXwCAoCN1BTZd5iGFR0EEwtCbYwYtascIgSiFd8eWg3vNuepa8+Wdz0CM1pIk0FrxzENkvemLygK6Ga4tAOXoNqc3JuHEk18ahpqCV+a2/TPeyaiONm9W5wiTJ26a1BsgxihuUUAopFqleDSP+2IVT5+amsy6K0wurJLTsLNdQYLZ8I6CXn8FNSaxWKFwou0OGIt1jEtgvXGe7Qdi3hyqAk4WZnCd9okoxk6m7o2AhR9oYBocWnQ3wFZNCetvMRG8Hd65czw53iJ57BMvLPCoxYwld1WEpKZ268d7vwtI6KF86FuBX8MyYrlAD1vU8xpUaw6ywDDxB3xoSrLm67FugHj79Orft7oJrfEF2l0aXPj/5jNT6ItTAwEFuLJ6Sig9VNeQYjmajksTB1nIdbAloBbvIsiqQbSst2v6Ww8HCYB/2OwHG9o1H0SOvVbA5F0gZZugYZLhCKKjcuJZX/P+FCDCqS4Wfk/hqV/frk2m3ab72O8yxJLWSPiy/J7NZ41I0fU/ZI6JK14JTiDiaSIFDanOWWgSRMI7VWT1t1KGEo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f94b4533-09bb-48f7-3a48-08dcf4206174
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:29.2704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o76nB67NSzcO1AU6r+w8t9ncpvJKMg3dF5+Ezes5iaylzpJnZuc9lahOcxFO06AiJYJSPyh6MZglIEwz5c8cng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: TjZbT7faKZiGPyEJF1dsNHKmqN_zYRdh
X-Proofpoint-ORIG-GUID: TjZbT7faKZiGPyEJF1dsNHKmqN_zYRdh

This adjusts everything to use \fN...\fP rather than \fN...\fR everywhere:
the few places that were using \fP (usually \fB\fIfilename\fP.ext\fR) were
re-expressed into \fIfilename\fP\fB.ext\fP. \& was added in the instances
of this pattern that weren't using it (about half were).

No effect on terminal or typeset output, other than very slightly improved
layout around the filename stuff above.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 cmd/dtrace.8 | 72 ++++++++++++++++++++++++++--------------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 355484bd0d34..1f2d48a07531 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -39,9 +39,9 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
 .LP
 DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
 .LP
-The \fIOracle Linux DTrace Guide\fR describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
+The \fIOracle Linux DTrace Guide\fP describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
 .LP
-The \fBdtrace\fR command provides a generic interface to the essential services provided by the DTrace facility, including:
+The \fBdtrace\fP command provides a generic interface to the essential services provided by the DTrace facility, including:
 .RS +4
 .IP o
 Options that list the set of probes and providers currently published by DTrace
@@ -57,100 +57,100 @@ Options that generate program stability reports
 Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
 .RE
 .LP
-You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
+You can use \fBdtrace\fP to create D scripts by using it in a \fB#!\fP declaration to create an interpreter file. You can also use \fBdtrace\fP to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fP option. See \fBOPTIONS\fP. See the \fIOracle Linux DTrace Guide\fP for detailed examples of how to use the \fBdtrace\fP utility to perform these tasks.
 .SH OPTIONS
 .LP
-The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \fB\-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
+The arguments accepted by the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, and \fB\-i\fP options can include an optional D language \fIpredicate\fP enclosed in slashes \fB//\fP and optional D language \fIaction\fP statement list enclosed in braces \fB{}\fP. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
 .LP
 The following options are supported:
 .TP
 \fB\-b\fP \fIbufsz\fP
-Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
+Set principal trace buffer size (\fIbufsz\fP). The trace buffer size can include any of the size suffixes \fBk\fP, \fBm\fP, \fBg\fP, or \fBt\fP. If the buffer space cannot be allocated, \fBdtrace\fP attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fP property.
 .TP
 \fB\-c\fP \fIcmd\fP
-Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+Run the specified command \fIcmd\fP and exit upon its completion. If more than one \fB\-c\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
 .TP
 \fB\-C\fP
-Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
+Run the C preprocessor \fBcpp\fP(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fP, \fB\-U\fP, \fB\-I\fP, and \fB\-H\fP options. You can select the degree of C standard conformance if you use the \fB\-X\fP option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fP.
 .TP
 \fB\-D\fP \fIname\fP \fB[=\fP\fIvalue\fP\fB]\fP
-Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
+Define \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). If you specify the equals sign (\fB=\fP) and additional \fIvalue\fP, the name is assigned the corresponding value. This option passes the \fB\-D\fP option to each \fBcpp\fP invocation.
 .TP
 \fB\-e\fP
 Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
 .TP
 \fB\-f\fP\fB[[\fP\fIprovider\fP\fB:]\fP\fImodule\fP\fB:]\fP\fIfunction\fP\fB[[\fP\fIpredicate\fP\fB]\fP\fIaction\fP\fB]]\fP
-Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
+Specify function name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fP, \fImodule:function\fP, or \fIfunction\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fP are specified in the description, all probes with the corresponding \fIfunction\fP are matched. The \fB\-f\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fP option on the command line at a time.
 .TP
 \fB\-F\fP
-Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
+Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fP. Function return probe reports are unindented and their output is prefixed with \fB<-\fP\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fP. System call return probe reports are unindented and their output is prefixed with \fB<=\fP\&.
 .TP
 \fB\-G\fP
-Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
+Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fP option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fP option is not present and the DTrace program is contained with a file whose name is \fIfilename\fP\fB\&.d\fP, then the ELF file is saved using the name \fIfilename\fP\fB\&.o\fP. Otherwise the ELF file is saved using the name \fBd.out\fP.
 .TP
 \fB\-H\fP
-Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
+Print the pathnames of included files when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). This option passes the \fB\-H\fP option to each \fBcpp\fP invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fP.
 .TP
 \fB\-h\fP
-Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
+Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fP option. If the \fB\-o\fP option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fP option is not present and the DTrace program is contained with a file whose name is \fIfilename\fP\fB\&.d\fP, then the header file is saved using the name \fIfilename\fP\fB\&.h\fP.
 .TP
 \fB\-i\fP \fIprobe-id\fP\fB[[\fP\fIpredicate\fP] \fIaction\fP\fB]\fP
-Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
+Specify probe identifier (\fIprobe-id\fP) to trace or list (\fB\-l\fP option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fP \fB\-l\fP. The \fB\-i\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fP option at a time.
 .TP
 \fB\-I\fP \fIpath\fP
-Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
+Add the specified directory \fIpath\fP to the search path for \fB#include\fP files when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). This option passes the \fB\-I\fP option to each \fBcpp\fP invocation. The specified \fIpath\fP is inserted into the search path ahead of the default directory list.
 .TP
 \fB\-L\fP \fIpath\fP
-Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
+Add the specified directory \fIpath\fP to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fP is added after the default library search path. If it exists, a subdirectory of \fIpath\fP named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fP. (But take note: dependency analysis is performed only within each directory, not across directories.)
 .TP
 \fB\-l\fP
-List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
+List probes instead of enabling them. If the \fB\-l\fP option is specified, \fBdtrace\fP produces a report of the probes matching the descriptions given using the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, \fB\-i\fP, and \fB\-s\fP options. If none of these options are specified, this option lists all probes.
 .TP
 \fB\-m\fP [[\fIprovider:\fP] \fImodule:\fP [[\fIpredicate\fP] \fIaction\fP]]
-Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
+Specify module name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module\fP or \fImodule\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fP are specified in the description, all probes with a corresponding \fImodule\fP are matched. The \fB\-m\fP argument can be suffixed with an optional D probe clause. More than one \fB\-m\fP option can be specified on the command line at a time.
 .TP
 \fB\-n\fP [[[\fIprovider:\fP] \fImodule:\fP] \fIfunction:\fP] \fIname\fP [[\fIpredicate\fP] \fIaction\fP]
-Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
+Specify probe name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fP, \fImodule:function:name\fP, \fIfunction:name\fP, or \fIname\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fP are specified in the description, all probes with a corresponding \fIname\fP are matched. The \fB\-n\fP argument can be suffixed with an optional D probe clause. More than one \fB\-n\fP option can be specified on the command line at a time.
 .TP
 \fB\-o\fP \fIoutput\fP
-Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
+Specify the \fIoutput\fP file for the \fB\-G\fP, \fB\-h\fP, and \fB\-l\fP options, or for the traced data itself. If the \fB\-G\fP option is present and the \fB\-s\fP option's argument is of the form \fIfilename\fP\fB\&.d\fP and \fB\-o\fP is not present, the default output file is \fIfilename\fP\fB\&.o\fP. Otherwise the default output file is \fBd.out\fP.
 .TP
 \fB\-p\fP \fIpid\fP
-Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+Grab the specified process-ID \fIpid\fP, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
 .TP
 \fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
-Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
+Specify provider name to trace or list (\fB\-l\fP option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fP option on the command line at a time.
 .TP
 \fB\-q\fP
-Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
+Set quiet mode. \fBdtrace\fP suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fP and \fBprintf()\fP is displayed to \fBstdout\fP.
 .TP
 \fB\-s\fP
-Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
+Compile the specified D program source file. If the \fB\-e\fP option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fP option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fP, \fB\-l\fP, or \fB\-G\fP are present, the instrumentation specified by the D program is enabled and tracing begins.
 .TP
 \fB\-S\fP
-Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
+Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fP.
 .TP
 \fB\-U\fP \fIname\fP
-Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
+Undefine the specified \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB-C\fP option). This option passes the \fB-U\fP option to each \fBcpp\fP invocation.
 .TP
 \fB\-v\fP
-Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
+Set verbose mode. If the \fB\-v\fP option is specified, \fBdtrace\fP produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fP.
 .TP
 \fB\-V\fP
-Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
+Report the highest D programming interface version supported by \fBdtrace\fP. The version information is printed to \fBstdout\fP and the \fBdtrace\fP command exits. Refer to the \fIOracle Linux DTrace Guide\fP for more information about DTrace versioning features. In conjunction with \fB\-v\fP, also reports information on the version of the \fBdtrace\fP(1) tool and associated library.
 .TP
 \fB\-w\fP
-Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
+Permit destructive actions in D programs specified using the \fB\-s\fP, \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options. If the \fB\-w\fP option is not specified, \fBdtrace\fP does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
 \fB\-x\fP \fIarg\fP [\fI=val\fP]
-Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
+Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fP. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fP).
 .TP
 \fB\-Z\fP
-Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
+Permit probe descriptions that match zero probes. If the \fB\-Z\fP option is not specified, \fBdtrace\fP reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fP option) or on the command line (\fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options) contain descriptions that do not match any known probes.
 .
 .SH OPERANDS
 .LP
-You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
+You can specify zero or more additional arguments on the \fBdtrace\fP command line to define a set of macro variables (\fB$1\fP, \fB$2\fP, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fP option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fP.
 .
 .SH EXIT STATUS
 .LP
@@ -159,12 +159,12 @@ The following exit values are returned:
 .B 0
 Successful completion. 
 .IP
-For D program requests, an exit status of \fB0\fR indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fR returns \fB0\fR even if the specified tracing requests encountered errors or drops.
+For D program requests, an exit status of \fB0\fP indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fP returns \fB0\fP even if the specified tracing requests encountered errors or drops.
 .TP
 .B 1
 An error occurred.
 .IP
-For D program requests, an exit status of \fB1\fR indicates that program compilation failed or that the specified request could not be satisfied.
+For D program requests, an exit status of \fB1\fP indicates that program compilation failed or that the specified request could not be satisfied.
 .TP
 .B 2
 Invalid command line options or arguments were specified.
@@ -180,7 +180,7 @@ Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
 .IP
-Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
+Options set this way are overridden both by options specified via \fB\-x\fP on the command line, and by \fBsetopt\fP statements.
 .
 .SH SEE ALSO
 .BR cpp (1),
@@ -191,4 +191,4 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
 .
 .SH USAGE
 .LP
-When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
+When using the \fB\-p\fP flag, \fBdtrace\fP stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fP running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fP tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fP(1) and killing the offending \fBdtrace\fP tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

