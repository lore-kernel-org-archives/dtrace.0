Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48EE264A86
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771362227; cv=fail; b=tNjrpePorf6pd19kV52AGoKUxUBQM6qBjKJF0SH2HDehvnMAzBjxR8dMDmnkHfnQX1BWSL7VuVpzuCwndWFgTrPAIJJ8Ne33mpYT19WhIKeJY+cYapC+eEHU358yeG7UNmHmX1cpGH2tWLWHp3yjKpeQDAqBSlYNoy0E2FQ3e3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771362227; c=relaxed/simple;
	bh=1LJ9L9/9VkWBec88WyVbAJYrDGSA6K9m2BqHwQoJbyk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ashU1Msun774gNPZYUzCoDLL+iafdvjNX4AZMtNaLraz0OSdHUAvm9O+Abw20Rmjstg6nWPOi2XNQfO8ut7Fey6ZKdvOoIyyf2XZR2GooqqU3Tc7uUxxsyakPWd1GpcG+hW2+Cph8PPDkjM1IfoUK060/qVkZyaOvJqh/fhixBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DK65Ae7Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yW2Y2CXD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DK65Ae7Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yW2Y2CXD"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNMiN026231
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 21:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=uBxvhsvab39TCRT3wNEMR9IkjUigDCpfhMC2e9BKlPY=; b=
	DK65Ae7QimeUEK9H8l9xoHXDhn3saZKJRtg9snjpA8E+pglc0XzN0il0a1wckELO
	kwrkUZeH4KrQIkNKkaxmmWVhIJMfRG8effHbOKfZrJe445tDzTgEmbmSE92OQcXG
	8pV1ZUd3vmQN59AvjpmhEkXl6KoP+wH5HuUMr/t9VdyzFMW/k1vgg7aO6K56DKZH
	8eY0hv0Ubf4pcp1FxUdvQhMnyFXZhE+jk72ZsRAjN+JPKwYI39ivORvJkP99Jswx
	wNamEeMHjS5+HqrgrdhskchvsxXjk+LdhXbVPMNS4knA40O7y8EbNDMSAmSzujoL
	486liAVjOu9qMHjl2KOEQg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0rcfhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 21:03:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HKMYQo037113
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 21:03:43 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013047.outbound.protection.outlook.com [40.93.196.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb27rra6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 21:03:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjsQCFl6mPGJv5eplc+1D3GPkaF3v4g8WFUIMTgb9zr2EmPctNarCwXnEmNQ176UlDev+0t8NTVeQLkliu7G3CcB+aEcr1mAzzADwhZsuKkd7yewjP/G4U5bDsi4xfwv3GC8Xs9eUhj3Ar4cBieOWyW6dhfwMtyyulBQcCogWDDpBrUFBDbqr7ixh0VRvuHBTGoMhYmB/Z8Twu+ska1BAUNN3BJipSLUmKgqBYtTM/rUJmTQc4stIzovU/tJ2olM7xUFVgw+j/BVQo8kM+tWlrrxXQ6/8wt832NheS04dYmTpvttUqpblP6qBt2t9RH5JHQilqCmIhx688O5CIEVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBxvhsvab39TCRT3wNEMR9IkjUigDCpfhMC2e9BKlPY=;
 b=UYgoZ0SsszTV05pJmJE4mjG01egb8VbxAqEKM8ATjEMAcNUO4sT05Q3/dM/I/bq0juEcytdXDQveXDvXWVUb4BeR8jPC2O5VkDz4WJRo66zTeq15Dc1pUIQHQxmNvyC5cMUv1ldKhqzMekD9I6BMsncfdMh3PaTUMTiEdj+ARNs95y8VK1K5QGkdp2CsiVa8OM1BWJZ0bUodY2sevybgEGGLN4/nLkqh97NEzOueRntoKswODZ+iCCz/0vn9wedWJ3bZEgfFoZVxKQ7aPXF6VVNJUqle6UK5OKNhPooeq/n1KmS3rBH5azTcEP2Z1hrUIKLU8clwDWBhpyZq+s1MEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBxvhsvab39TCRT3wNEMR9IkjUigDCpfhMC2e9BKlPY=;
 b=yW2Y2CXDEnP9wGqF99f4CYiOJWCIw1BfMJXSx31hjAQihXE4GnyzC6gRK8ue2ScGL7i5s3i5/6Z7UXpMGAgEsINlHlwt+b8u0ctfvaLxJDjJki15jkUC/YpvzrZZcRg9aXIFHbnA04RQsPv8VCJxR8pCED/RwDBazM8E2fUWhkg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB8138.namprd10.prod.outlook.com (2603:10b6:208:515::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 21:03:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 21:03:40 +0000
Message-ID: <77a78d0d-36c8-5540-6635-4ac8bbd72f60@oracle.com>
Date: Tue, 17 Feb 2026 16:03:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] configure: add support for
 --disable-option-checking
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB75222227FA6AB2FF619DFF29C26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB75222227FA6AB2FF619DFF29C26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:610:e4::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6ea71f-7a02-4165-2d29-08de6e680709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MDRKZmhTUG8vY29VRUhoeGxzamk0RDhHN3NMYTdzM1ZIZWtYeVE3S2t4RHZD?=
 =?utf-8?B?Tjd4SHhJUUdwZnVwUXduQ0RxY2Z5TVJMVUZwUURrYUJjajJjb2pGWWpZOGJX?=
 =?utf-8?B?cjVGdmx0SzJ0bXJWN0hkRU9nWkJWam9oY0JLSHBBK1B2U2tESUNZRkFmK2VX?=
 =?utf-8?B?U053K202Qk9kQWQ3NU50NjJUZ01TSFJacFRKck90dkVBbEtDRFgzMS9ib3Zq?=
 =?utf-8?B?UzJ2TnhSa2dVaHNZeSthODVlVytGOGlXYk1WQ1NuQ1cwNzJTWDN0cmZEbHhx?=
 =?utf-8?B?UkN4R0hQOVBmY2lJSllMWjRldkZXVVpnOXRJcjVyeHo5aU9aZVFsc0FzOHoz?=
 =?utf-8?B?WnFVOWZpQjNuYVc3ZTJrMFU3VHhJc0NIVDEyajI1RWh5NEUvRTZFSkJRVVFs?=
 =?utf-8?B?UVdKMk96QXplVWxyRFVvbUdMMnkwVUQ2M2M0ajZOTlZlSXh3UzR3Tm4rRDF1?=
 =?utf-8?B?MDFWWlVaZVdyOFpzcVI0Y21QN1ErT1U4WG5oQ05xTFVkTzZ1Q1VNenFpUnF0?=
 =?utf-8?B?LzhkdTdvTHZqM1A5aW0rY3I2VDR4WDFTZEx4WW9lOHdKTEFab3Z3YnFCdVJX?=
 =?utf-8?B?UTlYNTdZMGRWcEZiUWlrK1hyWXZJdTRqWEc3b0d6ZTBUcXFLTURkTFJxTCtz?=
 =?utf-8?B?aGMvdElrejJJVm13d2srVndXRVRTWGxPK0FxTFNrditsOTZoV3FpM3ZOSGtu?=
 =?utf-8?B?V29DcEtlaW1DZWJLYTBjZG0wSmt5aitYWTBTMnljc2tkd0dmVDVZcXp5a0ti?=
 =?utf-8?B?WWNZK0taS0tZY1JLRGV1VkFFV0pYbHRseGh0Z3RwVll1QmZoYUQ2aDlUQ1RQ?=
 =?utf-8?B?WDhCczlBOWthd1J2cG1QRVZ1dkxZVlN1V2FDa2RBNnNjd0NVaWdybjhpbjhS?=
 =?utf-8?B?WGIvRTJCTGIxd0ZuTTY0QmxaRXFSc2tOQVJ0a21sc3RtN1p4YzJva09ySUEx?=
 =?utf-8?B?T2NqcXZPMjNpekU0aWxqcys0ak15ZWFYN1ZPQWxKK1ROTEg4WUw1VFRCRkln?=
 =?utf-8?B?Z2hMODVNSzJvQk4yWHNQaW1RWHVQQ0Y0T0JjMTNzS0ZjdFlXWVMxMTI5a0cy?=
 =?utf-8?B?U1BGTmNERVNVbnhXTDhOeS9lRkk2LzVwWnRtdGJibGY1eHgxZFZiTmRPUUJl?=
 =?utf-8?B?MkRXdC91N1NmdGtMTWw1SU1DdTIwOUhDRkxsNEtNOUJSYk0rTUp0QlRUSzA0?=
 =?utf-8?B?MkRaUWFsODFLeHhxVkpsVDZ5VzNGUVZRWnBqQ0FIbytINEJlbEZJaEJuV2JI?=
 =?utf-8?B?ZVB2cnFmVzc0ODhQOExUVUpENjNVSEZMUFJBaitDMVBMWUNFamsyV3l1S2Fv?=
 =?utf-8?B?M3J6SVBuRzFWcjVuNUxBVVY3eWtDSmxidVN2NFFEMFhSVjd4RCtoeWhhell6?=
 =?utf-8?B?VjEzUWNUcmhwV3dSNUU0b2pzVUlkKzNMM2NqV0VsRDBXS0ZMNUNkS3pLb0hk?=
 =?utf-8?B?SG1hQVpaK2FQbFNYbzVnaHZ1U2tkYjV5K1pLT2hueFVlY2RRVVFFV3pMdnVE?=
 =?utf-8?B?UTFZM2hXSVZWeTM2akp6d1VIYW1DSTNwTXpUVUk5U3IrSnBVVTc1Qk1DOVhv?=
 =?utf-8?B?ZGd1czdJQWZ3ZUVoKzVHeGFNdFZOQTlxV2tmL0FHc3BZMFBmalBsTThNT1FO?=
 =?utf-8?B?dnJ4TjVKNTFncmJmODFzUjJpV2I3Ny9HS0lKdTlXbS9WOVZPWVVVMUZqZVlh?=
 =?utf-8?B?ODFnUHE4d3FGaTUyaFkwKzd4NlRmY2d5U3d5V3plakI2Qmg5WlhPRFJoUENU?=
 =?utf-8?B?U1lnN3JHcWs4NE9Od2JCdCtlVkRrSXFoTWh4K3F4ODludmpuK1NpclNLVGtt?=
 =?utf-8?B?WloxODlteXVLVU0xTVFreUlaMmhLU3RPQW1mSFdEVXZobjY1MzBHeXVocitJ?=
 =?utf-8?B?QStDb3Z0UENCRm1IU0hLT0h3eXdCT2gzdVl6ekVkd3kzYlFneVNvQWxjL2Zn?=
 =?utf-8?B?aWJnRmNhQVdWcnlHM0RJczNXaXdNSVFpa2lpN29BZlhtRHY4bVp1WTVyQ3pB?=
 =?utf-8?B?bllSenVZeFk0MitIOHdFTlFQaXl6SjdNQ2JURjFubFFIUWNCNkJCVHhIMC8w?=
 =?utf-8?B?T2tjUlkzRVZvYkM3UWV5c0ltNHVQODhwODRKMFJDcDJRdGxPOE9Md292NHpm?=
 =?utf-8?Q?G2HM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU5ESmNuV0IvQkIwVE5HM1FxeXdqZHRTS3duNTFwb1dEYWpGblFrV0RRSDM5?=
 =?utf-8?B?Wi9LUzljdjVQbHlabnlPeE5TeFEwQ3pZQlZ4WUNXM1hPTTlhVm9CN2trZmE3?=
 =?utf-8?B?ZUduM2dqZHNPTk11eFRsRVF4YnJ3TWdCd3BxeFZFVnJEeXEvc0VKVDU4NE03?=
 =?utf-8?B?R1hCUDlyZnJUa3kySDVwZUl1SHVEL3I2Skg2aWZzdlB1ZEFGTEhESWNheXpn?=
 =?utf-8?B?em41d09HY3BMbmdyTzBtSDBvREsxRFl4WmN0eDFtMnZDa2RQYklKT29WRFFQ?=
 =?utf-8?B?S3U4WnRjd1hrdHlLV1B2QUU5eE5sVlN6aW9DVmk2UWVXZFI0eTZtS2ZqYmxo?=
 =?utf-8?B?UzlReVVaeEQ0WEZsZmE3M3dqTVV1QUVRZ01XOEViVFBlcjBwdHhsNjhoRTgy?=
 =?utf-8?B?WGRiWXcxTWdWOFE1SHNrNWFxTFlKMkhZVmxCQTh5ZnRFcGJtTkVJVGJyTlIr?=
 =?utf-8?B?WkJxMzhHMXNwemJ5NTRvallWcEpQSS81VU9YdmluNWxvVS9zN1JiUjhKQzds?=
 =?utf-8?B?WlJLNHVIWU9uUVBwTWVXMW90Q0c3M3RrSU15QitKbkhkOVhJd2czZE0xUnRv?=
 =?utf-8?B?eEtoUXdLSXJjR3VrbDJqaGgydGJBTW1ia3RkVG04L1QybzhkdUxhYmhDbnB3?=
 =?utf-8?B?ZXB1S0hMTjN5NjhVMWxVaEhnUUZTVHFoelVYN1k0WTlDYms1QytkYlRLQlRO?=
 =?utf-8?B?WVdCbjdFN2JLRmNnU05mSFBvRDVoNXVZUzJuZkZoTTNMQjBkUkpraVpOSUxn?=
 =?utf-8?B?elB1Z1ZxRTdJdGlnWVllMEVtSW1WQ3ZCZ0IwNGMzOTUzNTFqU3pCZENHeEs5?=
 =?utf-8?B?YmgvS1lvMnBOZ1F1Y3AwOGFuNEovMG8yRFBMbXJmUFNCeVlLYkduTWt5bzg4?=
 =?utf-8?B?c0hBbW9CTjhPTHJZUG10c2xGUUlkRlU2WmJaOTA1YWVtUjYrYU9UUjEwSld2?=
 =?utf-8?B?WXdxR1ZySmM4Q3pOTnZ3eEZQdklkVm9oU3p2S2JYOGJlRDZ1RFM2T0tpU1p6?=
 =?utf-8?B?aGVaejRrOU9kUnZvTlk3ZzlhZjNLVzhlZXJzU3N4YmJmckljM2JXSWZ2eXYv?=
 =?utf-8?B?UnM4M2NTOFVWeFRMc29wL0ZCTkxYaUFlZTI0Z3M4NzFtcVZYV201bU9lNllt?=
 =?utf-8?B?c0lsOFNZTUY4ZUVpcTk3ajFoNnBMazhIbGtacWVDZEdpejIrLzFyRTVveDlk?=
 =?utf-8?B?OHhKN0IxM2xac3N1d0p2NDVZVjc3QWR0VFhkdVhCTlJ4M25tREtDc2VWTFNX?=
 =?utf-8?B?WEtyV0FSZEJrS1BzVjYxYnJGVHpSOXo2V0lVSmlKaVA3WldMWUxuUmhaSXY1?=
 =?utf-8?B?TGo2YWVNYm5Ya3FRMUlxcUZaOERITjVnK3M1bU5tMUVxVFYxaTZ2UFo1bHhH?=
 =?utf-8?B?YUtBaU1JNTZvZXE0aFRxMHJhTCtkYlBqa1RGMEp0UDhVVzF0NmlFS3gzaTM4?=
 =?utf-8?B?RVdHTzhtTFozY2VPcDdkKzRCS0hVU2hjRmxDenZFR3JEUnpUcnp4WjlWR2lG?=
 =?utf-8?B?dnRzeFVrMkJOVStPUnRHTlJ2UlU4UXNja2dScVIrcldiUW0vRkwrY3Y0ZDBQ?=
 =?utf-8?B?S01WUEcvOFgxcnNxNU40VmZsa0hBam0yVzNHU2Z0Q0lwekVhenE4eEhRZkds?=
 =?utf-8?B?ak8vOXF6QTdPMDBSSjZIOXVBOGFkQjFDME9EWVJYdG9nOFRUNHpoTW0zL0d5?=
 =?utf-8?B?azBJRmxVU24rTmNPOGNhUFRISG5MMGpmUkROdG84NXJpWWVyZE4yZDR3eGQv?=
 =?utf-8?B?R2JxeEhkZXgvVXQ5aTBPMDB1dFFNTExETjNLY0dtMnJFRFlLM01BOXVBNnQv?=
 =?utf-8?B?L0FyWGIrRGIxdml1d25DVGYrYmQyRWpvTndwUXFHTkNGR09VWGM3UnNHYktG?=
 =?utf-8?B?RmRFbTIzcmRyQ0xPUjUzZit4cjN6czg2bEJMTlM0YVNIZ0VlTmVlS1gxZ1Vq?=
 =?utf-8?B?K1pHMllzSWpMUGVISmZWd2tBdGxhSUxLUzhCRUJqV2s0MzQ2MW9JWXJoZ0Fj?=
 =?utf-8?B?VmN1emJBaWd1b0RRSUhmNTRra3pKeGRXMU5lOWh3Z3c2anRYcHhKbnpvZlp6?=
 =?utf-8?B?clVHaHFIelh0dnFTZkp6MUIwK2hETXl5dnpRU2JCb0hVVFVKR1lXRFZnUWtO?=
 =?utf-8?B?K2s1L0hzeWNHL0hZWWMvUnhteXB1VjhJdE1MK1lLemVEdVpvejQrWlZ3eTM2?=
 =?utf-8?B?OUM3RFBMSS80UWp6OTU2WmpYNFMxY2dLLytTR0tYbFpvY0EwNnpkemF3Vlp4?=
 =?utf-8?B?Q0ZpTXkzQ25MT0piOXVVVzRvVXJMZlBoakl4NDFMQ3N4eC9SN0QzdTBvT1N1?=
 =?utf-8?B?YVVGR2RVSjQ2UENFRlArMldoUHgvQ2RYK3JlbUFVSXkyV2M2eHN3UT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aqcV93JmzZc6AaxgLUJ4qeZRU2mDOzDWOHfw03HQx1+GtkMeVtE7teZVQ3PXzloAB/g6dhYgu9Wh4MAQuyAjdKvlnnfSYae1XONnsiEuQbrb6E7w7Cn10B2RmZJCGCEwBhTSJ1z6LWRTYBC6KgfdfAkjc+TDZvwVAYHWHODSG3TW37Rvv9aCv4rkMjrbgy61nWkGElotYom+xd2d9jsrA2XmLOGQ4+PTh93K4J4N820w/GtuTHcECbxh1878fovm88YU1zYinLV0szdC7f66Xfew1E9trLUaLaeOCJDPWosa76MTw16FSTV3iih6xsQUpuMb2hdGERw59fAyzWIEnRCyRVhSDcAaugimTEK9G8vQuoyslXShWCtfvq4CWL4x7CsGy4hAsMQVedIEovyPAU8omlporCxXWJvYKn6AFn4V7WsrGnFlUVx7+HXmjXp2cfS+WMpu+Xblc9rjmddSrvtYfEyUKO/PXmK6Dm7Hx1/64L+kl1LzUIMuJDaotT9KmNczaf40awVzUEv/XuZxaIViXKJVQgJQskXckfkCpHUOuMgY51MwuVzgBGH86UT5La6F6bIeCIrUPmWSE+ggSRqqtFjgUpZxPhNE0wSQml0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6ea71f-7a02-4165-2d29-08de6e680709
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 21:03:40.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shv2ygt/a34RpiemacbTF/d2o1ZqibxPDA3JbDSEW9qL7zuHLEFt3JtEquFceRlELZzQT3FRVmjc238zHrAerQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8138
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602170173
X-Authority-Analysis: v=2.4 cv=V6RwEOni c=1 sm=1 tr=0 ts=6994d7b1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=shsdTtzfyazyZ1x-ce0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12253
X-Proofpoint-ORIG-GUID: 2GbgWG0CMQlPoE2HOBh_E90Y4pZkPzRW
X-Proofpoint-GUID: 2GbgWG0CMQlPoE2HOBh_E90Y4pZkPzRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE3MyBTYWx0ZWRfX+ZQv83R1ENox
 +jQ2wq4Jnjb6haFp/woyvDPji0FTj3MBww1mLanN7h76xT3/8D6qD3Pz5FQHZpfwwa2o7L7EE8v
 I8LyZD4NDcC3utJdaP5tskrZ31HQcEajuyOtX+kgaRjh+DS9wp+WsW0hL1BGt1tF1DBXEl2XtB4
 +lnT0SmYivf/0/Xrj1zFO9OwPM/NcuJgOpnHbHB8USsgHrxAjLVQQQHh8/LUmgxTCUgXTUXly1/
 dlaCYl+EHZD0ts4CH2MzHGO9jmJXj3eDQvUVw5Gx/s7m3q8/UuHNLYun7LHEgmwKz4lRDTpWVue
 iInAE/gGyZSCw87GNWxaDetxHlSs31++b47ucf2kxvBin3OLG2OcXtwQWMH/uqn98/JYcjBYlgh
 49haQZV5/wzVT9DoUtTyTNQ5t2L7Gf6dfK9pQDcJogo2btEaT5KpqRpk/cEepdLDMRZ7MAsanTF
 NRxv1n9msM13w5Z7zhDMW9wGG8S0S84rb3b++A34=

Looks fine except again this should probably be documented when "--help" 
is used.

Also, I don't know if you agree on moving those enable-dependency 
options.  If so, I guess this patch won't apply cleanly?

On 2/17/26 12:01, Kris Van Hees via DTrace-devel wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   configure | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/configure b/configure
> index fadac05e..f10c7f4d 100755
> --- a/configure
> +++ b/configure
> @@ -123,6 +123,11 @@ rm -rf build/.config.new build/.config-vars.mk.new
>   echo 'override CONFIGURED_VARS=' > build/.config-vars.mk.new
>   trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
>   
> +# Should we report unknown --disable/enable/with/without-* options?
> +if echo " $@ " | grep ' --disable-option-checking ' &>/dev/null; then
> +   no_check_opts=t
> +fi
> +
>   for option in "$@"; do
>       case "$option" in
>           --help) help; exit 1;;
> @@ -174,6 +179,11 @@ for option in "$@"; do
>           HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
>           --disable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "y";;
>           --enable-dependency-tracking) write_make_var WITHOUT_DEPENDENCIES "n";;
> +        --disable-*|--enable-*|--with-*|--without-*)
> +           if [[ -z $no_check_opts ]]; then
> +              echo "Unknown option $option" >&2
> +              exit 1
> +           fi;;
>           *) echo "Unknown option $option" >&2
>              exit 1;;
>       esac
