Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D55214A66
	for <dtrace@lists.linux.dev>; Tue,  1 Apr 2025 23:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743548646; cv=fail; b=BsxaOQ6kgbS6BN/VPDdTsZFjxvA69XKwCfZqpOzFUjPafDGO7vVFy/6UXVsuV9fhpOGJmSaxKcjk0SQZZ93NfjHijngRiB7G5apT7K/UGBKsPnuZeugNEwJzsT+iSvWJRssQMrj0RpAOQTyneWlhIr8DZjNJ0m8phIbJiD9H8VY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743548646; c=relaxed/simple;
	bh=SJKvNCn7nBZz6BJXhAa6HHRK55civ/iaTDJACNtwESU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PSJhkPvj/TgtPwYvsxgQMWA7uaRa65b+TPgY54rrIj57Aykqu4Rq1t+GEdihNWySZ0R0DugHpgpyChBvIVwtinbOZ6JGNOm4rk2ghgxWOeYtrYIMvUe6gcOk30s464F/QeMlASUkCU95mrAEwC2q0peuvTcPBcH1Rp+yJAf+LzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gPV2bsO9; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CgLY0t1x reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gPV2bsO9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CgLY0t1x"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531L29qH029529
	for <dtrace@lists.linux.dev>; Tue, 1 Apr 2025 23:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qzODNe5xj9bWrYz/cVkm6jsWIh9U0QktFb8Klhm4/pY=; b=
	gPV2bsO9XQr5VWA/F+DT1x1e284KPNbhOo5ctIXkodLDmVeIdmXCc2vHwqoiz5TQ
	fT2xBinmU0gU17k9Bx4behGyLapEO9ND2cm1PJU3nUz/C1lg0GjtZeeL8EZgSbr3
	JzuRaSHPmfOFVzWcYpSkvGEjUkQHBrwS9M0DmbeEfDAbC8XfnxraNkw3IQ/ReWbR
	cvcKKRWsO3yFfJJ3930jbxlBxQne/PH0VDwPok8c+O1N0zS6rgeml7qH+/3PWiDA
	FeyKIJG7r6c4vj8OxswTyOLaB7U0XQQKv7eG6y4zMQqPoJSrWbgGqm23/eetSUhJ
	YsvL1K16d9ifgGz7jQmGwQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8r9h3f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Apr 2025 23:04:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531MR9Ov003397
	for <dtrace@lists.linux.dev>; Tue, 1 Apr 2025 23:04:02 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a9ts2n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Apr 2025 23:04:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oO55td+l/VeNNmhQPbBotxJ7dsj0SZOmDzBGgLBSBEDZ8OB71hDLAJHFbS+TfP2cR7M0tcIdyQ6dSghXDbuFC9BgOLPXuUC6xJ6ppHbGwk3lvwDatK1uniSYKIdDMsRdQ+YwTBDgOiUacmb2s9ElhigFZ72guAKi9vxOdNQAppNZfaE7+tF8UW4LaPhaVc5W/2tX0FTkLngVFbW4UYh6V0PMsDVtRIJoWz+tVUNINwoBUSyWLbQzJohV+hpykBPTUXmzRZS4kyDdvdTHVB0YBsK2iIv4dc9KF0uXfs8U545+B7FLjO5O2/JA/2WLPcIB56wuydfaUUr9Mwm7q1a2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXzYDgk1IGWUANyD/AHxpbvgadUQDIiKbEfe8IJ0SLk=;
 b=g5G/7hG8lr89FyfW5g4i5hsRel/Jjj2SWvSGGPrZUyMa5z37+AICG2rWTeGVQ1AT+Ti3XvxzVUI13TZkg92fyELR6FmMONvl8Nma6QFSDM+m5kbo6bKAUOn8k0GKVsNR5pH4c+G6PTNK+w3aWCXRUvxItOndkLabXcNopVNCN8aL04Wv/ztxkybutP7L0JbIqXG3hO7UEm4e8uA3o8e/UXvnHs2ydskmtbnlisy+S4m587w2Hjs9v3URD3NO+Wtu0xES60GFxi+e5Vbhq9jVQp5BLPb8BBdQ9w8IWeFa3ZOMjHkMd1Y8nWsPWuLi3H4sQeZSR75n7xBSQ8lpZU3Ifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXzYDgk1IGWUANyD/AHxpbvgadUQDIiKbEfe8IJ0SLk=;
 b=CgLY0t1xo4jgbdK8Ry2pmKYIBjvuBJeONDSMQyJNfmieUgeeHVrKCcmDsMDVE9rEN1nYX/cxOM7b0xnPMN+mJvqH2BjjOTwmvLn+GXiKJ5naEfsDD9HZoJ7p0Y6TsEX+Dcv0pxiIgoNQ73JfpxL0n+QjxGTtl25bP3QbV7y1Nio=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by MN6PR10MB7465.namprd10.prod.outlook.com (2603:10b6:208:47a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Tue, 1 Apr
 2025 23:03:58 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8583.030; Tue, 1 Apr 2025
 23:03:58 +0000
Date: Tue, 1 Apr 2025 19:03:55 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 1/2] Add a cpuinfos BPF map
Message-ID: <Z+xw22FDG66lrCkN@oracle.com>
References: <20250331214501.24126-1-eugene.loh@oracle.com>
 <Z+t7UAN7i+Dkpc5e@oracle.com>
 <fd3e36b0-33f6-9d4f-7997-30dae143c6e1@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fd3e36b0-33f6-9d4f-7997-30dae143c6e1@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|MN6PR10MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d7ef66-b234-4e5d-af29-08dd71717c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?9IhpTQRrXt2f1G4tzPpeNY5bVJa/Ij92oGnHvDBsKEzHo9zqrYCF2yhdgL?=
 =?iso-8859-1?Q?qC3OiYu3XVxPx8gr9VB5Xmxc6RTp0Z795js10pvxo2Jeae/7rImFPLZXQW?=
 =?iso-8859-1?Q?W0wPXGeL5Opbi2ueWnM8fC0C9WWM36/IeV4ru1EFHis1R+89a6RU6yDfRH?=
 =?iso-8859-1?Q?ig1f5crqx+3RoluKWysdEePtNQCdhxk8u7CSRBwroNTp9deUuJWMt3RcDJ?=
 =?iso-8859-1?Q?wkZeIP7+0Cb+KIC07/FKl19cSfbZiSfN3dLFvTMCh92srRs8QTTYtYIPqI?=
 =?iso-8859-1?Q?8+6/33LPQkbYLee8cEEp4kUz/PpsDXQ0sChezr04JxjfQkwVFrR6N/jMpQ?=
 =?iso-8859-1?Q?4iUl0/Qs8LQ9HkgsCJqzaPyueN1CtF5++Ndw/jZ1IDCFWcOydF5X0qRILt?=
 =?iso-8859-1?Q?rN4fAGkun135eFb9kna+E+zDziRIjtcNuHyglH+A9dcU+fB5fxH9Jx7hln?=
 =?iso-8859-1?Q?9iiK2UDA9ecj0pZhrPGTr5BxDjRdGHIztHNbM08E/elsfbDSl9pyjt0uOs?=
 =?iso-8859-1?Q?pQkqm0F5rjnDHzFSZmG5LM+3Aqmcu0KY2q4R0XIt9pY0U61ww5zlh2OTAd?=
 =?iso-8859-1?Q?zA2Jm9Fa1V3OOYsgPzTJYDxzwlIxdkYnS3r/mmlzTOa6KZjK+g/mAHQoFr?=
 =?iso-8859-1?Q?NSWgdALzdhRMDOSW7krvhoIAjWEfYJrqusbJ0TwF2aU5hR2ED93rBTQoGW?=
 =?iso-8859-1?Q?0/MA/9tQbZRI+KPis+6ignvyXIkZOHBIbl++fu9po1BL0kVnc3aWzxxiDi?=
 =?iso-8859-1?Q?aLNFwwjNsr9BZ4jIqOBTk798nlbnLt8IkuRr8Wk5NUpv/eg/63QuLknZzF?=
 =?iso-8859-1?Q?xsAMM3OUhf9Eh5MXnz6dVHARHVlTRqoZib3MqOLv2VdBUXrOJT2I50O004?=
 =?iso-8859-1?Q?XypxUGMCCuiQb3m5uB6vnKt1WSJQLhC8PlMZzPD/4JjFGDCWcBvkPstSZ2?=
 =?iso-8859-1?Q?vSvB+f31Pd0gFfYxiXYhiVp0Ac0A5a9q04Ph3bXeF6eICvGMNGenBiCz42?=
 =?iso-8859-1?Q?tJQN9UHBbh/pyyWBNz7I50d1SyloMlzFWIuIieyVbKU3Gl55ROmsYa/67/?=
 =?iso-8859-1?Q?fPpbD1bVWYy7vYJ7hUNypZZmWcVLGsxSmI6eySALyQcbfB6AUlCJbrUrc+?=
 =?iso-8859-1?Q?x/HrFUUZTAKAksmaIVYoZ38x0CcajFn5dUauC3jNo7H4jKzlS/PdhscnJE?=
 =?iso-8859-1?Q?vFeM0F6PVLR6r7ffqbheill3Y/Sii8BduyMMDz4C56CC/egNnulm5io7lw?=
 =?iso-8859-1?Q?dDgWQcPE0+odV7mdrZQBj4SL+rwrlcXPAA1itk42k8ezZDU49AFV/9mo2N?=
 =?iso-8859-1?Q?P/SncFtnvQeuQdXJuhS00lET1fDxbsEXfP8WFOgu+XrwtLLqURhWLGe2Eq?=
 =?iso-8859-1?Q?7NGj0JHqhRKvPx2KALLnwHq7JIgtNlaPHN4ej/aEk7k9KV8/O+68wY43+K?=
 =?iso-8859-1?Q?AZ78IwrzjWVWmm32?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JooqBN3TyuBuy2f8C+5v6Fr36ewHctr0AXC/YORNTSfEAmRozcZ5YYUAIj?=
 =?iso-8859-1?Q?7ze75Oz0FzS2pYKYjFawAdCG+Zvh271bXLoHOi8aphitDthAn0CHk0/094?=
 =?iso-8859-1?Q?Mm1kZrvCsZJCwJiF3FNdsO/eHiNbjtuwArLd1+pSrnWWvcEYWwgdQEVOvM?=
 =?iso-8859-1?Q?LLdEx6TaA7z1A0mP+iINZI4/GgJiulsc/Xy7WtvTLH6KNHDkpXwl/FZPfE?=
 =?iso-8859-1?Q?nJYSYqqU+ydTaLhPfYTxxH0eua0OfVjf3re07yyxCepcA8LhYkMUWICNwb?=
 =?iso-8859-1?Q?lx3TBUUDhzaAsPMCVfwFQxIODjBINBsGJU+cSjsPTCni6LM8NLCq0dU6za?=
 =?iso-8859-1?Q?AMqWhKKxCp47ZPOrXlEXlXJc+gP98n6ervTgkJiCQApOLhsSv0rn3r6iWS?=
 =?iso-8859-1?Q?YhE6tvHmMfWnmnmuNTP3Dj1dkTsShJviPeTCEM90lULeAalI4SW80KYUtq?=
 =?iso-8859-1?Q?KebHsqYVVxaw/IATUghP40UXm0x/sfivPGGFlr9Qx6yctOOs2n1777p/1z?=
 =?iso-8859-1?Q?6fcilvPCtVUPEcR4w7UbnWBuO2VQG68rpFzUdwFc0Y37adCrem5a22rSSx?=
 =?iso-8859-1?Q?jV95vQmDbZLdsnEaoq3XjF6B164GyodPyJFOLego3ZqCmHSm6LXWe5n/2j?=
 =?iso-8859-1?Q?s+QQJITwIsTmjtK5jzTi9r7p4NqdJTSKicns3tcFiM8gRhoQWHaq/bP36T?=
 =?iso-8859-1?Q?uUWFexK3u9aXVnCbyVjhcOz0+cYvzGoOHapRsxsnsHr/Ih+Ex7aoRz97Fa?=
 =?iso-8859-1?Q?izBAAVHG2eyDnTEF2fiWCA1rL9ozVWiqyH1CaJvVWpLg6qeLvd/8LH3EO9?=
 =?iso-8859-1?Q?9jCQx3Dklh25AFJBr01dFygjAmlvzvmlewFJRnZRXjIJBPENVG0A02qJxB?=
 =?iso-8859-1?Q?ItsnQATyfADNsGzSfTRAKIIT9wX05vufKMS0MC8Yo92ewnbhNlErB0DbCJ?=
 =?iso-8859-1?Q?JQBu6H/GGRJj34VowzlnF6N52BIqUgM+fTByCyzuga8C6FzrHjOfWU9Czc?=
 =?iso-8859-1?Q?N6nhaf0wLcaQg4l24oqmeYtp5ZWpYrW49yy8md71t+qOxY3yVPCP7/SIos?=
 =?iso-8859-1?Q?aGH0ryb/lLbFJUy38P9kgtfmjD5kGeaCJ7JFYd9W+ril08EL+cuuOJLko0?=
 =?iso-8859-1?Q?A+QekpJRXxpesqP2XUy7iuuzJFT5nicrywZdIRLIe/yUbC24fWEL3lBy3/?=
 =?iso-8859-1?Q?zoHjMH8+NonyRbX59yfJBR7/LvbXswuSoFIOJzjZ2Q9UiNgsRJCBHqhHVM?=
 =?iso-8859-1?Q?E2Y3Jw3HL+jI3mTZeIKsziatz8YDYzqgi6xlHIm300oLoPq0cUrJPIqDhB?=
 =?iso-8859-1?Q?Moe6TJ4v0myWuy4AzpO1+FHCSFkYsfsSTaiAj9fiQGm5lJPyb4k8xXcwsW?=
 =?iso-8859-1?Q?bTl1hUv254lRfO64RgttCqj9S1EKkCY7kl2+U5gCnG560Oc9ji3PYwJ1ct?=
 =?iso-8859-1?Q?x4R0F2PqqbnI95hJ7hpqQ9H992Kzblu5c11iLNMOgGPBNcUzI1fpM41FXS?=
 =?iso-8859-1?Q?iL916JdktkRVozdIGYrH5LF7i+wd1m4HToUq63qEpyx64XkYAldmtnURLj?=
 =?iso-8859-1?Q?IRnRycY+jhsPIq31/ifH5sE9pLLtXNum8cfJgVAlsBPMwqsE++m7HLR5x1?=
 =?iso-8859-1?Q?vLwztrOnqqW+b3N+vym1pBw4sIngbxKclTOerSR4L7Mt1IsdSTCtmpFg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IToUBonFXLr1XXp3scAN+NySHpc93SzF65lmMAP1Y/W0Svs4yZre0VQWn1V12lMTvItPg+swZNIekX9bxzL9biVyMsf/9mgKimWAM0r7TcZ8SGx67AsJHFsduIygJfyx9ITApzE0V75QXcOLYVsEz1w1wHzdUGzm5Q6kolcfpHxXr0eKhuBjNjKy5BqpFOZgou7rGBGXYe+Tmuj1tocsENst381K00WfWozOOJ53afqyGtkWsQ2AxTWkajV3Pyv/8WRlFA5OHoyA7B9qUaCWBaeyl13SwPmMfwj3f3tIMcnoQSd3QX6LSDOpXNn22/SHLd6ORd825SirY5i9ZaylibVIyXH7vcEmWgJbeefcMFSGTZw1pDclXqEp24i41UVpZHo407YTPYcpUpu+HAezeqZ+cyNOY7iTS1syU5YlJ1NhiWL1W+ErPndFKznsRPKZxJez89NUgI0R0fpcB+nz2teIgHjTjsOW+YsbZWv3jc4ARLdCSGo+YMVbMAiVFM/jUvgko+3zQ0du399Hw1IhlDFUe+7srsjDB/MZnmo+/OUfhBltuJq7IJMjpNuOPnoDhQeX2zqUv9+F+1Zl1dyyC7itOF0lodV0uvaK3qbESCE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d7ef66-b234-4e5d-af29-08dd71717c0b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 23:03:58.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sidKm17RpU617xFjuIqjt51gZwpW8/rnUf2oT4jgNloNJf4Fk0W3IVgqslCQrdwEr13NP4/hOWVxAk0eOBn/y8kzomuDi5mocM1XDH0r8kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7465
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_10,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504010142
X-Proofpoint-GUID: MnyXq_iVaGmISPZBf3ezaI_h3S4VjaJu
X-Proofpoint-ORIG-GUID: MnyXq_iVaGmISPZBf3ezaI_h3S4VjaJu

On Tue, Apr 01, 2025 at 06:54:29PM -0400, Eugene Loh wrote:
> Here is a proposal.  First, two observations:
> 
> 1.  (As Alan pointed out to me in a facepalm moment), one can write a simple
> D script to check enqueue_task_*()'s rq->cpu against the current CPU.  He
> and I both find that the two CPUs are generally -- but not always -- the
> same.  So, the strictly correct thing to do is use the rq->cpu value, even
> though you can just use the current CPU and be correct "99%" of the time.

Sort of what I expected.  But nice to see it confirmed.

> 2.  A BPF program can access per-cpu-array values on other CPUs. Well, I
> guess you need commit 0734311 ("bpf: add bpf_map_lookup_percpu_elem for
> percpu map").  That's in 5.18. That is, UEK9.

We oculd get that backported I bet but that doesn't help upstream.  So, not
really worth asking for a backport I think.

> So my proposal is to leave the per-cpu cpuinfo BPF map alone. Perform a
> runtime test whether bpf_map_lookup_percpu_elem() is available.  If so, do
> that cross-CPU lookup -- the 2/2 patch I posted -- but using the new helper
> function.  If not, use a simpler on-CPU lookup, which should be right "99%"
> of the time. (I have a simple patch that uses the current CPU.  Pretty
> simple.)

But...  95% correct of the time doesn't quite cut it.  I could see some quite
useful case for using these probes to specifically capture the times when it
does *not* originate from the same CPU.  Settling for 95% correctness seems
like an odd tradeoff to me.  Especally since we can get it right 100% of the
time without too much trouble.  Just convert the cpuinfo map to a regular
array map, and instead of indexing it with a 0 key all the time, index it with
the value returned by bpf_get_smp_processor_id(().  Then we have code that will
work on all kernels - no special casing.  And I do not see there being much
performance difference by going this route.

> On 4/1/25 01:36, Kris Van Hees wrote:
> 
> > This is not the way to go about this.  If, in order to implement the cpuinfo_t
> > argument to sched probes, a regular BPF array map is needed so that cpuinfo
> > data can be accessed for any given CPU id, then the existing map should be
> > replaced with the new one, and its use updated to access the new one.  That
> > way you can also keep the name of the map, etc...
> > 
> > Introducing this new map with exactly the same data, and then hoping to
> > deprecate the old one later is making things more messy.
> > 
> > On Mon, Mar 31, 2025 at 05:45:00PM -0400, eugene.loh--- via DTrace-devel wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > The cpuinfo BPF map is a per-CPU map that has CPU information
> > > on each CPU for that CPU.
> > > 
> > > Add a cpuinfos BPF map that allows any CPU to access information
> > > for any other CPU.
> > > 
> > > For now, we retain the older per-CPU map.  If desired, a future
> > > patch can migrate existing uses of the per-CPU map to the new
> > > map, decommissioning the old one.  This would include map set up:
> > > 
> > > *)  libdtrace/dt_dlibs.c:   DT_BPF_SYMBOL(cpuinfo, DT_IDENT_PTR),
> > > 
> > > *)  libdtrace/dt_impl.h:    int dt_cpumap_fd;
> > > 
> > > *)  libdtrace/dt_bpf.c:     dtp->dt_cpumap_fd = ...
> > >      libdtrace/dt_bpf.c:     CREATE_MAP(cpuinfo)
> > > 
> > > and map use:
> > > 
> > > *)  bpf/get_agg.c
> > > *)  bpf/get_bvar.c
> > > *)  libdtrace/dt_cg.c
> > > *)  libdtrace/dt_prov_lockstat.c
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   libdtrace/dt_bpf.c   | 13 +++++++++++++
> > >   libdtrace/dt_dlibs.c |  1 +
> > >   libdtrace/dt_impl.h  |  1 +
> > >   3 files changed, 15 insertions(+)
> > > 
> > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > index 6d42a96c7..8da51d6b9 100644
> > > --- a/libdtrace/dt_bpf.c
> > > +++ b/libdtrace/dt_bpf.c
> > > @@ -786,7 +786,20 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
> > >   	if (dtp->dt_cpumap_fd == -1)
> > >   		return -1;
> > > +	dtp->dt_cpusmap_fd = create_gmap(dtp, "cpuinfos",
> > > +					BPF_MAP_TYPE_HASH,
> > > +					sizeof(uint32_t),
> > > +					sizeof(dt_bpf_cpuinfo_t), ncpus);
> > > +	if (dtp->dt_cpusmap_fd == -1)
> > > +		return -1;
> > > +
> > >   	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
> > > +
> > > +	for (i = 0, ci = &conf->cpus[0]; i < ncpus && rc != -1; i++, ci++) {
> > > +		key = ci->cpu_id;
> > > +		rc = dt_bpf_map_update(dtp->dt_cpusmap_fd, &key, &data[ci->cpu_id]);
> > > +	}
> > > +
> > >   	dt_free(dtp, data);
> > >   	if (rc == -1)
> > >   		return dt_bpf_error(dtp,
> > > diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> > > index 21df22a8a..0f19f3566 100644
> > > --- a/libdtrace/dt_dlibs.c
> > > +++ b/libdtrace/dt_dlibs.c
> > > @@ -61,6 +61,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
> > >   	DT_BPF_SYMBOL(agggen, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(buffers, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(cpuinfo, DT_IDENT_PTR),
> > > +	DT_BPF_SYMBOL(cpuinfos, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(dvars, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(gvars, DT_IDENT_PTR),
> > >   	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
> > > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > > index 68fb8ec53..a5e42801c 100644
> > > --- a/libdtrace/dt_impl.h
> > > +++ b/libdtrace/dt_impl.h
> > > @@ -390,6 +390,7 @@ struct dtrace_hdl {
> > >   	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
> > >   	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
> > >   	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
> > > +	int dt_cpusmap_fd;	/* file descriptor for the 'cpuinfos' BPF map */
> > >   	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
> > >   	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
> > >   	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
> > > -- 
> > > 2.43.5
> > > 
> > > 
> > > _______________________________________________
> > > DTrace-devel mailing list
> > > DTrace-devel@oss.oracle.com
> > > https://oss.oracle.com/mailman/listinfo/dtrace-devel
