Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A07187332
	for <dtrace@lists.linux.dev>; Wed,  3 Jul 2024 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720038836; cv=fail; b=UlrQQUqDe/dp66CUttRkOkpkP+WkJNZthIedng5Dl2UPiJqPud7Y+7raMEhyVpSf1EuAlnsm6kl54pK0imO9IAf7jUtcclGodivktCDnOy2y3LGKkPzreMfCQSoDMxmb70JBo5MVtw3KTQ1+qnGWn1P+ZgBn0ilfnzekAg5tIIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720038836; c=relaxed/simple;
	bh=pXAuIRYegCoWiMvITFl2K1vG1j15to871Tn2+ayI7dE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VpLfjPCqCDv+Yr18j/SZOB7zCTx25IQa4DgqenZrXd+Kkv6FaE2myrZny3HNdCodpRcdyH7rNBMhehLgt72Q35epGYsujuKG6Kb2TS6S873FEuJFwkU+eYMnG8mxZFOslmhtWHBNOF0Nm8fHb2ML/+I+OpGlhS7EEp4MN+lDC9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gy0kDQew; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iRyUDTss; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gy0kDQew";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iRyUDTss"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463JfTW8031147
	for <dtrace@lists.linux.dev>; Wed, 3 Jul 2024 20:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=5yRO2T6KYxUJuF
	IVKHenfBIXQg7JJhy3IEygbWT2EWw=; b=gy0kDQew197nUQVeEumeq730YjCyU4
	nt4/kLth+9shKqZxpksmSB6PYWPlq03rVDZ01AUcP5C1ZZDN+45FpyL2Dhh5g9z8
	9aemqbygpX0du49Otfk4axMWC+rHu5hmXbKDp6yEWiFiBK4mKIpTBCnJ1LlYjUmD
	6jCT5Mo0X3RvuYDqy83BPELbQ5bP16EGSMg7vVyYUGhWcijlCnAvzbYeqR2Ts6bK
	gflpIwgLTzp/atM6AmyrheGbFCvo2m6ZH/CvEoHWUBQg8qIBIa2lbjExDv2gPaDa
	OLSBgGJexq9FM/ogtJAdGzm/EhZMFfI1lnsAFLsCnF58wxCO0NProx0Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4029vsrwu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Jul 2024 20:33:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 463IgZDv035737
	for <dtrace@lists.linux.dev>; Wed, 3 Jul 2024 20:33:51 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4028q9e0w5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 03 Jul 2024 20:33:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6gOPkPW+V91uJXMI4qHmVC31jEGHzSxrr5sOi//Nxu0GWEZ7flUFfDGTwXwDcIwpaUk4kgRp2Z465oyG/vpUEdVpICITtZZQxAU6dfNU8pfoueVDo6BVyQBtZZ2jVhAwyodtI2UDopACSfdmABsHxtdqckQbjuPoKLJUe2Slxg8W6Az4PLBF6ckLgQFVGYcDZ6cfB1Bxl9+T20DpJMnSttKRVWGgtKsiHasPlcu7V4BnsL1bP3hu5jmSI3AvqOM1qBGydFLrSAXMLs/mJE433weoBXQuPST0NLtzZuaUIyHFQh/WB2SsEUmai13+ZwTi9W8aIcLHCxUSzOQDpwnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yRO2T6KYxUJuFIVKHenfBIXQg7JJhy3IEygbWT2EWw=;
 b=lX7nXw3KU4Jc3hIElbpW2H5tZfZH1virozO9Z+BXDQKtESPAcgblG8EtKV7kyM4Ncd0qiAPElIAbLTgaqqPjqftF/Xlcqjqs/znh7oSmhFvzWtAhZQp675NUOl+O033+vEUq7sCyDRViGCqoBzKNtwHL6wZQEkuYTXFxNuDBsaGR8bfe+leFWeHM2BsjG/CmUKbz+PAHzgqcD8yqwgipiekiSfQgmG5DWjwBAhmf5yIp86sFYfNdpwxL9NMvJcZmg5M3AhDL6v8XdsBad//eGFwg8oGUn3E7IiTATzulUPSyJAEY59inXuPeTSmH8TXO769HMxAmTMeimLo9bJkwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yRO2T6KYxUJuFIVKHenfBIXQg7JJhy3IEygbWT2EWw=;
 b=iRyUDTss91hQ060y9JwY3AqQ/g1tn/vyODbR9Xj77nK6Fmg9glqLoAyjoNNSORI13CyD7pre/mSRcC43I61eWqB/YWgZJ9YmF0L8tpDapP4MxFQnk/W2WDgf5S6QqYvs4Q2+ASvlzVtQ/1XRRqHJORbUMlR53WI7csPBqFX/YPc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4458.namprd10.prod.outlook.com (2603:10b6:806:f8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 20:33:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 20:33:49 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 38/38] Systemwide USDT WIP
Date: Wed,  3 Jul 2024 16:33:40 -0400
Message-Id: <20240703203340.20808-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240703203340.20808-1-eugene.loh@oracle.com>
References: <20240703203340.20808-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bbd67b-8f56-4e3f-4cb9-08dc9b9f71d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NjWi4VZoOXXcsfe9Ylej6PhztWzCOXxC2Qle5HlEMOCaCu2iCtLheK/uvq4t?=
 =?us-ascii?Q?NdCHwdqyOcGRkw569v16VE2Y0z3wZr+owcdWO0DBg5FVbeXoGgAqF2y/Wqo7?=
 =?us-ascii?Q?dXOi44rjKRgLrGWV8eFdedosvoeHLj4OQ2SgKqEYn+yM/V7B0MV9u9gpTeyx?=
 =?us-ascii?Q?7y2Iy1qf/ztIrbfYQzsUslXZXs4zvG7mGicOyCaprokD3KSj9oNamaRiBpPq?=
 =?us-ascii?Q?xRKWzRhuL05kciIbZf1IN6UoVMgUAWFF4ljNcc93nBimcTq0zXF3IXM5VKn2?=
 =?us-ascii?Q?n2DKewRL+ER3xtrpWX2nIzZbjPeiA72DgATE8kIrLmD833Ix8k6H1zeFTJKo?=
 =?us-ascii?Q?bR9b3jNbxCRdkH7Mtnn8G3gUXv97MaoKe+8PRPU/0IVBlDRQMsNjJIHlic2K?=
 =?us-ascii?Q?JpeWDJlDeVJ4IyxzMy+UqajtzMCpxrE6SZ2m6ABxZWiQIw6nlrUvMat/96UZ?=
 =?us-ascii?Q?fk8IFcUDXsY0iKQzMvXEdyFAUmfXczXohsaDPsIAv9AtNGeNRkdc5lyZx50Z?=
 =?us-ascii?Q?goZyYh7myZNoMkosstEvF3TTSyFCWkSPGaewkv5T4KpzSJ0kXHMfUscfhNHT?=
 =?us-ascii?Q?wJtMh2iG2JczPlzzDWtpQAFITZ7dUKedOcm0PC3QlIjKLsZR7VUxODg0Ptn1?=
 =?us-ascii?Q?8Q8+PF0R9qMYRNgq15goVzlMV6zUO5QXsq6Wpj2Cfo6SDmqPhEa3vgjBUtQB?=
 =?us-ascii?Q?PK/NLUmdb/4DHB9RlALd/U+0yeYm1XTJ/mX38Qsg8uPI61O2mBLt6l+N70c6?=
 =?us-ascii?Q?VUYy9x+SkeU+FSVqA9IKKkHuCJm++BCepuxJfxZvCch93EEFzk/CXuXmT8LJ?=
 =?us-ascii?Q?SVZfyDixklWwuw+gpM8DlCjy68BzE9v1BQkbPexd8qnwafdvxavcnRfwPw2v?=
 =?us-ascii?Q?KkIv3yHJTVyGhfXJm7E79PGexrSV0xNpiT2rIAUdPleqBZT5EdRgB0ZCzcQ7?=
 =?us-ascii?Q?PJPKIpEiPb44r8O47Tmps0ugIHDTnT606YwmrQU4YX0nC7w/34YNsSj2Jlng?=
 =?us-ascii?Q?R3l12nRQwmDusrCcHIDg1q7goDoL47YvCETgLf6CZHZmdcCGHjayfyjCB4Mn?=
 =?us-ascii?Q?gi52qaTip4I1w5vePUs8ZhDbXebYDXBhD7f0zhVxcpjtZAd+e8whyeSIu+fj?=
 =?us-ascii?Q?t2EbFXBTpqY/TJxQmZNLj/faTtLal0tFuuyBssmkBfKm0u78ocgnhZOKnCPA?=
 =?us-ascii?Q?5xWq03hzdWLp/JYDhNgVLZjbmBahk0nh5qbwkWCFjxPmXJXtviZCQs2gg9sr?=
 =?us-ascii?Q?wJfb027xhTfPYZWDRoNRFd4VtghDtbY3VfvlnBMuRAf994LeM13rtWKHNkmu?=
 =?us-ascii?Q?Zs1e1OV3chM5GmDd+U6w9++rWX7W8oLD9gWcgbkJpo5LKw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sfGK6n2VHAT08sfcjPgK+NBHn6Y0iNpWx7glmawlHEGy62g8ocjeT3J3t8mo?=
 =?us-ascii?Q?eMFyJj7E9TCW/nGnWgVqLiaq2Iaq1sRBZbS4wSSrlN5QO73TjQZHkw98RXHH?=
 =?us-ascii?Q?DkADqHrE+yzU0kBtQdgUdBj8C8hMAALpb/VEMGEH5DYB48E+33WfO7IASgsg?=
 =?us-ascii?Q?OaUieQioY6KS3643ZxsdVXiRC/wr5pzBYpZOW1sk2QeTqw3UxwKVPKS85d9r?=
 =?us-ascii?Q?EV8bbBI19jnpDPZbMOKq7OGrSh2igWsnhkwoPUKTfWhTkOamjF8+UULK+Ty4?=
 =?us-ascii?Q?FF4mQ75kWltQcS7V1Yy0R46v/c+TrUr9qmYb5qskzLYvFj7aXoi4rcXt4L9S?=
 =?us-ascii?Q?ol5EOZ97r2pfzZp3jm5gK+h6NrwD7NLRwwMPXMFYTe+OA6+JSYUGf1wO1zjO?=
 =?us-ascii?Q?jADV1cECuqtwTrwAEgZG2VmFXSz13b239c42EQjE+yK4UVhWfp8iVA3ZBOdH?=
 =?us-ascii?Q?d0ZXc5nbfn7dVjDS7BO5D7kYNkKQl7UCj+BRE95XLwaCPWN9rUsNgWxWP/TO?=
 =?us-ascii?Q?hfu2HuZq3+irTxpGxYumIgvw6AahTpyvux6WvjkZwal9paO2fK1Bdu8Sd2MG?=
 =?us-ascii?Q?a29dqQy1reRVCBt03QrOTY9xHzzfdQzTgcmBOGZlJUk7nXdkDpIbiF8DiuFb?=
 =?us-ascii?Q?zXAeCd4JVH8lW0siFt144D26XIOhdDWwdU62lXNe30xLh/o0VX1mvcCzOO/S?=
 =?us-ascii?Q?VubQ5X/k0tWSfhMQOiRHgOl/BibeQiZxp9Rut8ZO0xXcBvbvXyu4iEFU95Wr?=
 =?us-ascii?Q?qz9W4F5Di8SgBV0GqC775olsWcpMLS8FK5Xgg4K6BMDVSsO55bgXnTrjZ3Hz?=
 =?us-ascii?Q?xzPlx2dMZ1DHl/gZNZS/aBppgZysC27qjPhme46PQTsH/UGI15ibZ39LbHCm?=
 =?us-ascii?Q?emG+LP8dIJE0YL0fMaatBdMuFLFr62+u/Pg14B0ZCouLIH0LAXk/LnLEp8Y3?=
 =?us-ascii?Q?/SlJFNhE9xeoJWHZvI18fZ1ClGU5jdmLj+rPyF5qYW/Oh/6D8RSN84zqX7xc?=
 =?us-ascii?Q?vbkHjY7Mxq8zphGsp0gwR99/wFEkKVfdPH0ZmqptN8NQt0DC/HvXQzxH4sal?=
 =?us-ascii?Q?CRBC/uR54ZwCa1NVUexic0zAIYNIx9QGNQx+meqlqM+aVQrk4UYsbliyTmCG?=
 =?us-ascii?Q?eTg7ufJJZL+BQdm3ovzYDQanAjS9dmLiRTsirQIZdvsW4zXYmWwwiVsQ4+oS?=
 =?us-ascii?Q?puKfjvKkOnVfshjKnnETPnQ3TNZ+iVBXXEnxPoQaiz0SFpR6J+kfBWzCXtzm?=
 =?us-ascii?Q?CyhoMQk8FR8zRrnRMZ8b2n1dKJKfUYjxRUp/o0otQkYqa9tqR+CHiYBuFpxw?=
 =?us-ascii?Q?jeq9VFGGENR9KMarG2ktZoy9yWgrNNY/QR1CW87onbr1/GvCfR2wjMl9qEzi?=
 =?us-ascii?Q?7rjopAQlYVOSmkvE6sO5dABegdj3g5RgLo9hbBPIG+TvNIdWWokDZyUHQNj1?=
 =?us-ascii?Q?f41Nh2Zy9b1ZfK69tZ3G1uq6lT7s828qwOZMFrhCuvNNffmDxF9FKHEYQ0Zz?=
 =?us-ascii?Q?w6VziPbYFHMRC3obBhzxpbyjZ76nI2ZLZztGowlCN7okK8z+kz1S3xdEu6k9?=
 =?us-ascii?Q?ty1H3TWEyzTZzB24ixBhHGYLCHeTsHmQS135cXzw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	kzJR272/5ruV1BZYYDQtMqBK4eH80lmHv2PVzFE4TUZqNP1/hrpCvp9pTQDkvograSscCdu5HKRRrLdSjLvY7by/0wBkOAQGeSF2d3Ruarux4bam/CxrWhTfP+2juGI+kgxQwcbFUumZiqElgoe9YDCJCvvnRFLNndOK78MP3EEsbnRBBSS59z0Ev4jZITHMtsiegpiuh3/UF+jkLmilHdjGZPRhLpZ/zfty4cMOm9WHXk/JCnq5HdZVFIAklOSXxPY9yODSCu1nPDQprYJ5ViQgqIF+LfuKMEUQFfECWHMNn3USBtbzphuDnzKRwAN+Drtw+LXPxcFgNJfAEvMoF0UBCAil5U8SCLGZl6cS/GlnKzam8lIsEqRKJu00ve84ltt07futLA8LYCDyf3Xs2LiANVYmkfr8K2R7PfBt0Sy0cnfyxYwWfN/hVdu0loPbwOh4AbHlDt9GhJt/CgdWFTp4MNPwq1wkWqLxXuwWO7ylTlb/d+mmj2Z2hTGIdOQDDP44ev3+1wX47iLobU6tro201mJ+d7k59eD1U0YGCnyJgvrC9k9vul8XsDv7kdeybxjpwKIq0rzFuH1AhqLsxroqr5xcGZ0QJOyQV/F587E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bbd67b-8f56-4e3f-4cb9-08dc9b9f71d6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 20:33:49.2629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j0Qh2iWL///4cgoLgAnbRKBTkfVMrLS9ENs5mH4L+/6Q1y23WDYZI2+F6Ze+ZxRoaRrN7XiO8nwTVeHE2jLgVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4458
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_15,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407030152
X-Proofpoint-GUID: uSSX43BsP4IoPXP6VVdTncuH75TBT1QC
X-Proofpoint-ORIG-GUID: uSSX43BsP4IoPXP6VVdTncuH75TBT1QC

From: Eugene Loh <eugene.loh@oracle.com>

need to:
- handle globs in dt_pid_create_probes_module()
- add process monitoring / inotify
- deal with FIXMEs

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c                             |  5 +-
 libdtrace/dt_pid.c                            | 65 ++++++++++++++-----
 .../dtrace-util/tst.ListProbesFuncUSDT.sh     |  1 -
 .../dtrace-util/tst.ListProbesModuleUSDT.sh   |  1 -
 .../dtrace-util/tst.ListProbesNameUSDT.sh     |  1 -
 .../dtrace-util/tst.ListProbesProviderUSDT.sh |  1 -
 test/unittest/usdt/tst.forker.sh              |  1 -
 7 files changed, 52 insertions(+), 23 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index d09a9775..cc8f7c1c 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -277,8 +277,9 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	 * On an error, dt_pid_create_probes() will set the error message
 	 * and tag -- we just have to longjmp() out of here.
 	 */
-	if (pdp->prv && pdp->prv[0] &&
-	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
+	if (pdp->prv &&
+	    (pdp->prv[0] == '\0' || isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
+	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
 	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 996543b1..484156b2 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -605,6 +605,9 @@ dt_pid_fix_mod(dt_pid_probe_t *pp, dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	return pmp;
 }
 
+/*
+ * Create pid probes for the specified process.
+ */
 static int
 dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 			 dt_pcb_t *pcb, dt_proc_t *dpr)
@@ -702,6 +705,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 
 	return ret;
 }
+
 /*
  * Read a file into a buffer and return it.
  */
@@ -780,8 +784,8 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 /*
  * Create underlying probes relating to the probespec passed on input.
  *
- * If dpr is set, just set up probes relating to mappings found in that one
- * process.  (dpr must in this case be locked.)
+ * dpr must be set and locked.  Just set up probes relating to mappings found
+ * in this one process.
  *
  * Return 0 on success or -1 on error.  (Failure to create specific underlying
  * probes is not an error.)
@@ -795,9 +799,6 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 	char *probepath = NULL;
 	glob_t probeglob = {0};
 
-	/*
-	 * Systemwide probing: not yet implemented.
-	 */
 	assert(dpr != NULL && dpr->dpr_proc);
 	assert(MUTEX_HELD(&dpr->dpr_lock));
 
@@ -1100,16 +1101,25 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
 	pid_t pid;
-	int err = 0;
+	int err = 0, i, nmatches = 0;
+	glob_t globbuf;
+	char *globpat = NULL;
 
 	assert(pcb != NULL);
 
-	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) == -1)
+	/* Exclude pid0 from being specifically requested. */
+	if (strcmp(pdp->prv, "pid0") == 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
+			     "pid0 does not contain a valid pid");
 		return -1;
+	}
 
-	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
-
-	if (gmatch(provname, pdp->prv) != 0) {
+	/*
+	 * Is this a pid$pid probe?
+	 */
+	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) > 0 &&
+	    snprintf(provname, sizeof(provname), "pid%d", (int)pid) > 0 &&
+	    gmatch(provname, pdp->prv) != 0) {
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
@@ -1119,14 +1129,36 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
+		// FIXME How should err be handled?
 		err = dt_pid_create_pid_probes(pdp, dtp, pcb, dpr);
 		dt_proc_release_unlock(dtp, pid);
 	}
 
 	/*
-	 * If it's not strictly a pid provider, we might match a USDT provider.
+	 * If it's strictly a pid provider, we're done.
 	 */
-	if (strcmp(provname, pdp->prv) != 0) {
+	if (strcmp(provname, pdp->prv) == 0)
+		return err ? -1 : 0;
+
+	asprintf(&globpat, "%s/probes/*/%s", dtp->dt_dofstash_path, pdp->prv[0] ? pdp->prv : "*");
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		char *s = globbuf.gl_pathv[i]
+			  + strlen(dtp->dt_dofstash_path)
+			  + strlen("/probes/");
+		dtrace_probedesc_t pdptmp;
+
+		pdptmp.prv = strchr(s, '/') + 1;
+		pdptmp.mod = pdp->mod[0] == '\0' ? "*" : pdp->mod;
+		pdptmp.fun = pdp->fun[0] == '\0' ? "*" : pdp->fun;
+		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
+
+		pid = atoll(s);
+
+		// Check, since dtprobed takes a while to clean up dead processes.
+		if (!Pexists(pid))
+			continue;
+
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 				      DTRACE_PROC_SHORTLIVED) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
@@ -1137,17 +1169,18 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
-		err = dt_pid_create_usdt_probes(dtp, dpr, pdp, pcb);
+		// FIXME: How should err be handled?
+		err = dt_pid_create_usdt_probes(dtp, dpr, &pdptmp, pcb);
 
 		/*
 		 * Put the module name in its canonical form.
 		 */
-		dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
+		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
 
 		dt_proc_release_unlock(dtp, pid);
 	}
-
-	/* (USDT systemwide probing goes here.)  */
+	free(globpat);
+	globfree(&globbuf);
 
 	return err ? -1 : 0;
 }
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index bd0552dc..99ae995e 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index 7b9c6a5f..5ae087fb 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index c5dfc72b..9d8f06e9 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 644da2ac..6eae82ed 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 7cfa9eb5..92513eb5 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -7,7 +7,6 @@
 #
 #
 # @@timeout: 120
-# @@xfail: dtv2 USDT wildcard
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

