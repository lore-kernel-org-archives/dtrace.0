Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCEA1E1024
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017101; cv=fail; b=WztRHMvsObZTqKU+SBgJtlVB9YY2IqEqVaP7Ct6I6OWOKY48usTfjXJN1sYjd1xa84lYUQhUtF9Pag43FvHR8Tht+n47CdsJCgPA0tBUzrK91gy/0MS7UQizNyj3GRwL2qoA6Qb2fwK7SGPlsJ6d47JA6BRs6yBU2SWYSSUvZJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017101; c=relaxed/simple;
	bh=OIiGxNJYU/MabcZUwgQike9YkWmjNKyGiyVhWGKArP0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uMgYrehW5CuYLPPF69eKjBm4/V1ZkxMCDmQBeYFIq++J9CKRrIL7vI1HpPZg3GAIYqiR4ClOgahqqiFKNChIceYqD+pcH+769kDIyvn1cpmXlTtAKnjreE3EXLGrANB1W5rwxl/W8bIjmdkg4kPC4Cm39QsIzkWd+szcHO6U5UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OcCmJITT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RHl02rfw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OcCmJITT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RHl02rfw"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6937e2El640228
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eLT47IELvcjSWxbgQTZAhSn2hYkIGfFw0G5GG1efFdY=; b=
	OcCmJITT7zuX9J8isxxL0DbiP0scmPiTLYjXbwBEMWi7ZAR1Kpr2JrYRVOIElm9w
	0TtrBIyQPW9p9ikx2XyTK5//D232InzJAUn/TY/YUXF/5m3uQm5c24SRrWD9XE9a
	UZNli8+yZcKukHnonACoejL12ahVZauxAwagFt0D1bV0zwBxpDdnqTkvoOnSfCtJ
	iDszkILvekRRoDYjqwA/B46baMwgKhKHVSsYkxCzFdkn8V1h7968He2lZ+YX25cT
	rRvvsqm90FLUH8aAwOySDc0A9GbugHCaf1irIzgAxCFi/fePYxDjdCtFut06sKbj
	dxKwEkenbM5OkA8EJG92Sw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2t8rr3mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:44:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938K3nh031057
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:44:58 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r596268-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:44:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duea/vsHkD89qWlE17D/A9lhVWjeifC+4VE8gYiMQhnlZd9V+z6bbret62WibZ7n6yOSJ8jghZiSrFewVaV9zt74z+9vkQ3GSO2BA9gk7XFzm/wTuz+kg9xAjZjdzNckgwsBOS4xSNGQki3AVjTruPJEkHV2KiQYGhEgI7nqo8zpX4D8Z4IKQMQ10LS7nEndaKFgRUi2L48JtYyCtbIC3SZzs114uRJh3neulZm8TGhBFeowFtf6DsBLcoynIvTeO+VS82i2nuySL33oBi06vfYnjjrof2BYs2RYScCU3EAN/dUY4yZvvX5olQ3Ka+vpJAG8hQm0gLf077DBGdpYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLT47IELvcjSWxbgQTZAhSn2hYkIGfFw0G5GG1efFdY=;
 b=lAhKuiqZZJlM0uIhiRnytZL0aIGjjBZ8g5Z4sRbrD3qThDsZZHZyJyvx0Zul8E8b0VR64Nu9nkuKCDKGegkyoE6TWcKa+FHIdarK/NCmsXgPcVSne/+JYEcXtyLWrDU9pRlyiwdg6XODBK+viknbTWzndzVphfMaeSf9pfduJM1mNSZqfKUZR5MMHESL+KgielXESJeYPfdzaRf9xgy39WVXrPXsVJ7hEnGsqU52eyybmlr/v0qCsoj876/Q0U7Vc0BKY7QNvp1Ng7hFTaEcZ9dqTV/n/Ju+bJUkTxitG6L8fl3SjsSEZ4qXhGBAHsNkDLAH433DyZhvQq7+YH3PmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLT47IELvcjSWxbgQTZAhSn2hYkIGfFw0G5GG1efFdY=;
 b=RHl02rfwRfn8Wm9VwQ8V5t3vNHu0evX2p7njMa6TjgVqCMrHaQzxwABeOmtsjMe/weg9+wfm/3OdAi9WHmyyOyClb2nT6jyXlFiS3LKX6AXEnFcBrg4TARzwGzdM/A5bDipdf7LNexazstlT3HSqOgs4d0k4OrwC9Ro0sMkAWOo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:44:56 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:44:56 +0000
Message-ID: <cac9f910-06a1-40ad-b07f-537260a58f00@oracle.com>
Date: Sat, 3 Oct 2026 02:44:52 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 2/2] link: no longer add utsname in USDT
 ELF notes
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <065856951b0fa5e001b995773402efcc@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <065856951b0fa5e001b995773402efcc@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0028.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34e::7) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: e790327d-7061-4b7f-d833-08df212a9990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Hs85FJeUfJWDRPEG9o390r/xh3vjO3CAEo7q8oBTa0I0Y0lJofqXEHvxkZDHMkW2OrDFnuRoTE5jbP00A8untyKFu2UNQo0s5Yj3r40oMa+QyrcsiUPpxm+VHlr1qA0u56NN2pG+pOmVU78gvCfth6Gbu6JxdbHeogBkRmJ3QI87mvRD0PrA8PGpZMZzmLTtYN317s6ol53pU0XD63aPQOGRsnjiQ+qq5XzDhpmVNsu9UOQAvdDwx+2LKFZ5m4tdZTPtX9m0LhBdR6f0WRSyaS6zCzfkyKIXf/nn+4768+MtpU4zcYX9GLEF1acR9sjaMaXbubLOUSNUQpsWndbJi8HNJva6tS6EFRjc6cDfklmTvVaOEo1AcUwyQiR82BqCH+awqyzhKi/WQDj+zTdiURZq36TM+i7VC/HdrrnXrhqdSH4AhWxL4rdZNuRzKcsyldnTrid+nYkBW7sGiV05Su5Ar+oMlIi0Qa97u00/4zBQDO/bSrS/ennyv/5beWLODZc5Jauu6dwc9biUBfl9G/eG1q2Ix0QO3vcqHeBmvy7gJ8Vht3pFLg8Rc6Xrzufm4a13C4ANNKNEKDlaySB9O3FovI+S5rolfeLfQ0DY/HbfHkI8CGmsiHrOPNY+b/+v/sNNlgOkS/iY6/vHtIKl74hQEtykqqQJ+teBoUam1Kk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anpRZSt5eFpxYW0wa0xnNmg4Nk5DcXdza3o3NWpqUE9WUGJUUnJXelhWWExl?=
 =?utf-8?B?RlpWbmhRMTlNMnFUclhYYW1XL1BhT1hiTHh4d2d2ZllHdnlveDhFNlQrYXFz?=
 =?utf-8?B?ZFdCUmJpQllvUWdUd2p1UENxUnpsbERXZjJTdjlFZjV3Z2c2TkJ3d2V6a0Nm?=
 =?utf-8?B?dU5SK09abU1QdFpEK1drSjZ3dTRmLzM5QzlUQmNrVXppelg2VktYRUx3VENO?=
 =?utf-8?B?TW5IYUlZTk9BQlJJb1J0VGUwUVRYS3BkZDAyci9hV3phWGovT0VWSkd6ODdh?=
 =?utf-8?B?bUFLQ3Y3QkJHQTVBTmRjN3AvWHdqTDByNVozMlRmTm5aZFdabENvUUhCa0Vm?=
 =?utf-8?B?WEtoY0NBYTdQeEZ2YW5LOTdTVFN6K1B1UzNPSEN2b08yRHQ3TVdFb1RiV2pr?=
 =?utf-8?B?V0xWY2lWSDBRcUZXUTFDM1hCOUVnRlNOQ3o4NGkvaDNyYUJPVk16UFZ6a0NX?=
 =?utf-8?B?N3V5SW9KdGRkSXhXNkpHYi9yYUNGUkx1QXZteVNpWVNJY3g5eGZtVTk2YVhE?=
 =?utf-8?B?dThRUHYzVFpVSGhoazNNOHZNTFlwSUtzdkpoYU1Pd3BQSUNMbExtVXcxR2c5?=
 =?utf-8?B?NXZQeGZoamVlcW5Za0ZqMXFvZmhLRnl1TUgyZ0R3MHJ1ZUcvV1ZvTXQvaW9I?=
 =?utf-8?B?T3BOc2pyajZXd2tZaHp4RXhjUkVnd3FmTEN5TVZTNnM3ZUFJVVdpME9lOVJK?=
 =?utf-8?B?b1UyQ0Uxd01pc2FIeG1Ha1M3QUJnMzgxdG1qWmN2R0tuVU9BbC9IMCtCYURi?=
 =?utf-8?B?Zld4eDlockFnQ0t3ZkU5TXVWRWgvb2hvNUFTcXU0WHdLa1k3by81VTRFUW5D?=
 =?utf-8?B?b1FGaUhyYjF6RGQ2ZHBHaGRYUXNjVkNYbGNIemNwWnl3bnBhT3NDblpxZVVr?=
 =?utf-8?B?STBiY3MwTGNUdjQwTEltWmZQdjdaMFVYS3VBQzkyaWZrV3M3V1hUNE5lMkVu?=
 =?utf-8?B?NG9hdXc5M2JYa2Vtc0pYOVR2QU1TYmNRK0hqdUtiQVVGQ3BQNW5CejJaRjNr?=
 =?utf-8?B?T0gzZ0IwYUp4RmdyaVYrdzJiWnJmeFpZdU5QdW1zR2QrV1NNMGxRVE8zbHNm?=
 =?utf-8?B?QW5wOXJraG5UR2VtWDRUbHFPT0dQUlo1bndONmhWeWxhdktVdkJvK2lPUWwz?=
 =?utf-8?B?b3U3UEZDY3U3QnpmLy9WWnpkcHNDaGFJVU9HZk1FZjk4bEJwRFY5WmFzQ3c4?=
 =?utf-8?B?REJuVE5uQnVXdmpqYkd5SEN2V2owMEt4b3p4ZkZmMCtLdEgyWTdSSzcyOG16?=
 =?utf-8?B?TmU4aGdyTitINXY2WDVrcjBJcWFGNlVoak8xQ0ZYTmhnU2d6QmpuY3FaRlRm?=
 =?utf-8?B?Tm1hQmJ6dkcrUm9ITWZLOThrR1N5dnh2SUYvQmZEZ3JxMnREU2tJOU9JM0s5?=
 =?utf-8?B?Mzl1a3lwSkdrWkkwdklRNWpFMnNMK2FHbkZRbmRjQjI0K0h6T2R3aUhjbkxH?=
 =?utf-8?B?RnBiVEUzaktlSHNFT3JJMzBJWnphbFl4MTRTRkZkV1cxWE4wYlhEdEpnc25n?=
 =?utf-8?B?MEtlWGFzcE0vRzNRRzJYWUsxUmx2V0RCTkRHZDBqeXE1N21meXNaYTZ1aWM5?=
 =?utf-8?B?aE8yRE5UazhWWU9XeTN1RUJ6QmtqQ2lhTmVqWVgrN2MwVlJ5V29jNHoxTVY5?=
 =?utf-8?B?QTJDOUFYNlI4NUhUVDROclNlMUhCZmNacnkwa0FRcHZuNHNNTTB0OWlNbkdY?=
 =?utf-8?B?OHBROFhLY1Q5ajFrS2dtNzFhZzR1c1dkd29MUXdPT25TTW1yNmRuSWRYd2xq?=
 =?utf-8?B?eG1MVy9NNzYwTHVnZzBnWVN0aDZjRnVWUzIrejhFZDhTbzFJci9ERGZQRUJO?=
 =?utf-8?B?bGF0K0xFdEp0OWQwWHRLWERtM3Nta01sQ3dlblc3UEUxakd3NUgya2ZVRUln?=
 =?utf-8?B?UEwrcTlPWmhpQ0RhQTFMTjRZRllKYXdza28wTzVyVDBCYXNlSUlnWU9kY0tv?=
 =?utf-8?B?WkpOZ3BGakhPR2tkTzN0Q2Y4NE5MOThtLzBlOTJGWWVLbjJuZXY1ZUlGb2l5?=
 =?utf-8?B?cU5Pb0FWN1VBUGdtSHNvcmhCdTFnYmkwS2NtRFhBYS9JRm9QaUs2WU9SM05U?=
 =?utf-8?B?VjBUMU5UMkFLUC9oKzU3NGtReHlKdEV3QlU2YmxZMkpxRm9VK3FuRWVHZ2hJ?=
 =?utf-8?B?eXd6ZzRzQlRPTlVyVXRFSEJrQTFvV20rL2w2WmRFTlF3eEtYbnI1MkR5bjRa?=
 =?utf-8?B?YlltUlQ1b0xwZnpmZFVZdzdBRmVPSUJMSDkyckRLZ21SWEM4SjcvWGVxSi9n?=
 =?utf-8?B?RnB0QWN1NjBPbnl4YWxDVkFocW9QL2pTbEF4KzJiS1NEcE9neUpRT2NsVXJC?=
 =?utf-8?B?NGNFY2dQUUtPNVYyYUlxTmFMQlRzSmdpTTFxbWhhb052WjJCQmZWdz09?=
X-Exchange-RoutingPolicyChecked:
	rzgEIKF81zG5s/PYAMF0cT6Z6WZGthcv1n+KD0t+RynBXZxkaMvvwk0HwUf/T6ctSIn+ScxMPgDHlofLRODTt+GypThdac5kU6if68+VTRA6fE0Dqbn6qZrBSEA8Fxk47xXq07UiCRSSpYpVyhjBmVn77LDWrOPRtQPbuqdO/FRr9t+I2ZTj5ostGj7wFk8jJZMvsBHH5srFxcvTrA9noUCTZclNqKhPaS8RvGrp/4FH3QEUKkgV56x91lMkgJABkxtkPu5+MeVEvogCyIfDkYLqgo2VGhQrQNB4/30AirOnw/NuEoEs/hG6n0igw8Kxmk/ID5MiKPIk8ipAJ2+htw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u98jPTXRZ2pS/nZ2/RGmzjvVkyzO6cz9gTasNc4LFEgwr6ThHRrN8nvx3Hza2SLe/M6EUgYAMBdHuz3uZ9Gri2kGkfj5EJ6f8bDj7V/geB437aLB8ZWc/u+lVnJINuqvO0fSkLtVrTL2iZuMga3cMmkfLpeWw7CkotSxpWhU3sBiCzvHs4zQnTCqHKzyFurZ+/TeynNbJ4Vz9oLbL8miVQMjYC/mCM54Q6CCck3qGrvE4KGUpDNSmJa53+C0b1jChUhKF0mBUaDRHn9zwHTBqaAiiHweIyzyBz46X5i7zASZ7JLP9H/5W22ub2ZlwXbb5lQ8Sxz2s11AYzWKKMHPyAx+e6/Yd4V/4HmfdaZWTA039cdW2WOnO4BiRhfv0X0rmCKPF5EHpcUuCvfg1Kclk85V3AZbuaCb40l7mqlfvK2e0+FEHoV9WdH9zVmpZm33jzm15aFKZDK8oHHXlPBVGZIAkPpwxgqPierxK/UMPVYDAJUjSehqc6UCikDgEofPzHuDh6JhPJyd4W7X4Ub0RlYwF3ECWFeAgMYLsC+EM9Ga+QqE/n51uCPr7eOZQ8ezxgMbuO7eGes2G1dH7P9lh4ftva8Ojcv2LNp2NPU1HqA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e790327d-7061-4b7f-d833-08df212a9990
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:44:56.0504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugaQw1VaQTYvcSpS6H76pUvo6mVOWkagHV10KNP3bnCQvIIVEyhTVb9GK9n+CPzs+LqYKsH3+tD6RmDPgARwd0qeULVO5pX7Vec4vRBHM1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030033
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfXy7QaGis6kGxz
 u3bIRzyppccYx036hGcqfHa3sN0NTWaGCcYzMChfwtZ+tgWFMD8Uq30LhlY7Bnz17ABF00w6MAM
 HqAMbqyPHt2/Q4DOjXHURgcFjnvRTLPSRTTO9F/p7TIIqqoGTE+l
X-Proofpoint-ORIG-GUID: hDv0WXuGSvAYWJRmTrzg-kzj0Kgl9JFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX6WRXe0XVycGD
 ItaYSg51pkegrtJPWgmbN4uk56jDCI5BFFq61X/QcElzZmZNJOzD7G/hcBB8DfflYiSMIiQzRgj
 nrz8BUDbCh+Nu/0UxyzvIyI3fsLEZEumjNK7vBJAD+aLfqSRMnAWWQEHYetijE3f4t84Jl/xQaQ
 GakIz+tUKqNcW1qkoBuC7eyz/alkem96X+7yacKpzbemLZjHB8qAFO2dylSpC96O1pmWSxGBshg
 i5Z4uGy2up5zwShoEXB6Je27CGS6v8lEIIJkG6tMwrrdbCz8LIurrpPrN7bNInVeMM4Y9Oh2OO6
 n31E4DBMlFyLa23w/ByXxCVJZcW7bhrbsCCb7QMuRgNcxfR4GDHJEHuIHXUPSF+yTSGHibQjGmD
 5KM2Ssde40f/K94ja7GG59qbQIq5pD0OQq0SonB7JKCTULFrjSex+r31AXlDPHkJfGkStdx3GcV
 NHilNj6eaPKwKEi7FCQ==
X-Authority-Analysis: v=2.4 cv=Ys2a1IYX c=1 sm=1 tr=0 ts=6ac0c08b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=0vVsowvZUffegHRM0wEA:9 a=QEXdDO2ut3YA:10 a=WmVTiCyuxqgg3mnwYu6p:22
X-Proofpoint-GUID: hDv0WXuGSvAYWJRmTrzg-kzj0Kgl9JFh

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 2:53 PM, Kris Van Hees via DTrace-devel wrote:
 
> USDT ELF notes used to contain utsname information for debugging, but
> this has proven to be troublesome for distributions that expect to be
> able to regenerate build objects with identical data.  Since the
> utsname data contains the system name, the USDT ELF notes were causing
> comparisons between generates and regenerated objects to fail.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_link.c | 48 ---------------------------------------------
>  1 file changed, 48 deletions(-)
> 
> diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> index aa5eb735..d8188881 100644
> --- a/libdtrace/dt_link.c
> +++ b/libdtrace/dt_link.c
> @@ -261,52 +261,6 @@ note_add_version(usdt_elf_t *usdt)
>  	return 0;
>  }
>  
> -static int
> -note_add_utsname(usdt_elf_t *usdt)
> -{
> -	Elf_Data	*dbuf;
> -	char		*buf, *p;
> -	size_t		len, sz;
> -
> -#define UTSN_NOTE_HEADSZ \
> -		((3 * sizeof(uint32_t)) +	/* namesz, descsz, type */ \
> -		 ALIGN(5, 4))			/* "utsn\0" */
> -
> -	/* Ensure the note starts on a 4-byte alignment boundary. */
> -	usdt->base = ALIGN(usdt->base + usdt->size, 4);
> -	usdt->size = 0;
> -
> -	len = sizeof(struct utsname);
> -	sz = UTSN_NOTE_HEADSZ + ALIGN(len, 4);
> -
> -	buf = malloc(sz);
> -	if (buf == NULL)
> -		return dt_set_errno(usdt->dtp, EDT_NOMEM);
> -	memset(buf, 0, sz);
> -
> -	/* Construct the note header. */
> -	*((uint32_t *)&buf[0]) = 5;
> -	*((uint32_t *)&buf[4]) = sz - UTSN_NOTE_HEADSZ;
> -	*((uint32_t *)&buf[8]) = 1;
> -	memcpy(&buf[12], "utsn", 4);
> -
> -	/* Add the data. */
> -	p = buf + UTSN_NOTE_HEADSZ;
> -	memcpy(p, &usdt->dtp->dt_uts, sizeof(struct utsname));
> -
> -	/* Add the note header. */
> -	dbuf = elf_newdata(usdt->note);
> -	dbuf->d_align = sizeof(uint32_t);
> -	dbuf->d_off = usdt->base;
> -	dbuf->d_buf = buf;
> -	dbuf->d_size = sz;
> -	usdt->size = sz;
> -
> -	usdt->notes.next = NULL;
> -
> -	return 0;
> -}
> -
>  static int
>  create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
>  {
> @@ -398,8 +352,6 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
>  	if (!(flags & DTRACE_D_STRIP)) {
>  		if (note_add_version(usdt) == -1)
>  			goto fail;
> -		if (note_add_utsname(usdt) == -1)
> -			goto fail;
>  	}
>  
>  	dt_free(dtp, usdt);
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

