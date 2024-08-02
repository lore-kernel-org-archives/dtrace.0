Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7096E481AB
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 21:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722634592; cv=fail; b=rXbz1oxsNQhmE/0CnFWN8kOU569NG73G/W7BKRLCP6qvs+06ctjVTdg4PEqtAvNFLcZ3Xgjc1xIB056DVQaZY6wKI8uLRmB+2rmRwqxlQPE1pKp2VT/jgfGxoKWt1/3HsRstP1nCgSxf2PrSn5T7qY/fE554mySYvs2ZmRGZxCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722634592; c=relaxed/simple;
	bh=oVN0pBhmHhorDtEscXCdQaavwN0l9NVnVVUDqvTnoZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lPwobe/RPZBSr4N4tP4NMnVdOTP9XNki0yO+QTUyNBKCsGPHc+ESnErwbjfV75YNypN32rgGNLuBEERF/M4JCno++thrHyrjyTH39IWRvzNGoNfurpom/QWdem8OlRTetW46xr9ISFzUorwCrha4ETG7YxEUmNBi3XwP7dnWDJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=acqMFGu3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xXzz1SGf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="acqMFGu3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xXzz1SGf"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtTNb013921
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 21:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=GxIDCjE6bjWxpDY
	N0SdmLm4mio9RsIec56kxWfl90s0=; b=acqMFGu3ZRh/pg7lJ5aqw5O1r20NJHw
	WE4EvWZwweCRrJISNHNFddV57qvwhO4hi6VnAf0ByqitukvB8eIASAVPDPBjZ5Kj
	WwmdxUJZr6GTw0juSUMwtGqBxFmzXRhINS92PpR8wA/CsjbjVTrCM1vIgGvE7kfk
	cFyhbU9PZKLZgAZaj8yKNi2fahgjXih3JJo/uFjCdqIDyWkE8t70xgB2mkaXLFQL
	YbOd5s/gjnlB2G5ZLuWTld8TRU6gsL0hCRFVs42jO+S9nakiEw4yCI9k0k6PNSdl
	iJswa97j4hMb0NfqKerzzYjynjnorLuMywzScubGlBlQ7tNiSi27cuQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjg32a75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 21:36:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472JxotF039834
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 21:36:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehxrmhd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 21:36:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUl9h/LuEtjqWYo5BnlR29DNEpsYKZNdAgvsE2o3YXRed3K9HKtQfGff4LgrICRC73tJXGzNucZi0xevV0gaHqZIjOsrU0QiOeosDaeEcXS6Dy1FtryAAAEwMGWS7CM9Zh7qDotLa9MpWRrZAGfIi8X5Ig3Q3mK6y8AG7pUEs0pk9zDn3hAP6UCQNQYlMzAaP2/zawr+sgD72hTBw5GX4eIsXBgXKc598j4+lRIVTj1LZRfx8L259BEtW9B2FDjJkxQzbVEdf0s3orLC4VjBB2qNggXb2EYqhHNi0AKDSZH8UgFwVsby1lf2aP1/Zn9aTyqfeUG/HvV5OaTTuYXLnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxIDCjE6bjWxpDYN0SdmLm4mio9RsIec56kxWfl90s0=;
 b=Xrutopc9TFmV0m0FghuA8VEh9NxsyVH6ajV0/OjLmWd6mmliE1kN9fak7XuYWwvxhAVvms0UAFNEUL7srv9qGQsaVG3xfE8lpspUysgAnr4/jmXstgELBRMuc2F8wm1Mp1ZNwfIf/UAWRlQpZxkzTVHXm1F+6es8Rj1o55a3He4p9BMPw+87yVQgJ9rRHtTIe/9Zy+8na33posZ1bAa8ChSuNt3XVQU0P2FReN6f77N/in3UXwL7SP7UtKQvC91f+6lSt19lM8rQ5Uj5bSJOATB6VvJtVbVEG/Sz0fRG32quHN38NBJ2SaafiM7Iqg0snP9WOPgVOVYHNBoH43yKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxIDCjE6bjWxpDYN0SdmLm4mio9RsIec56kxWfl90s0=;
 b=xXzz1SGfqrG/FfAgZmrlfUCCkAn4CiH+1gfqvSJAqwv86c+fuXNzxf+AbVbaFUgk8H3fTy7y5o0aH6nbfa3/+7l7th9WWwaXr5mJ8P13MHRlbg8usW9RCpz0x008ntdI7lQfVJMSFGltpEVgHKC32KKKGZ8r67MQ/wmSELjRGwo=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by SN7PR10MB7073.namprd10.prod.outlook.com (2603:10b6:806:34e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Fri, 2 Aug
 2024 21:36:25 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 21:36:25 +0000
Date: Fri, 2 Aug 2024 17:36:22 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 1/2] sched: fix firing of sched:::on-cpu
Message-ID: <Zq1RVomi4YJnF/My@oracle.com>
References: <20240628171634.2801954-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628171634.2801954-1-alan.maguire@oracle.com>
X-ClientProxiedBy: MN0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:208:52f::9) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|SN7PR10MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 67132646-562b-4d02-f7ce-08dcb33b28e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kyYkRsqZSjIw8UgrWgWR1P6yUPkQv1w9ZPwXLYbwxrgxtit9dfThVKz1Dsod?=
 =?us-ascii?Q?aH+YDDYt3V41DvjwZTpyb7w58vh0XoNrt7hs4qCWRtNRytPHEA/l4ozgaBWV?=
 =?us-ascii?Q?WHh9gvASZXtTI6VD6MeJVDe0cLe/+BSVA5nrV2G3XQgPQO9UxS5f4GMqMUZ8?=
 =?us-ascii?Q?nf459fNmIsbE2AmGiF77AWiLQgW/V/ubmdLTAQViqECX2cN161/xz+xetcxp?=
 =?us-ascii?Q?XwtZGuMsHnF/0EtxBVystYlSTOtxGM+mg2PgNJUUNA5gnttHmW/hBGPoA53Y?=
 =?us-ascii?Q?uFqH3oYjdqCfcx2wvEjyf9MHD2K+SG0vbaDN3NT6evp5yu/1xaq7jiiJT2u8?=
 =?us-ascii?Q?IPZKIy3zD1wUyxWzxFJTznLLY5Uv/glxHhUb7NSYM9o1/C9kGsL3cEStHDAY?=
 =?us-ascii?Q?v5RQnh1cF66OJ1YWXPABMhBA/zFmq2CbNXwz7JKdywVRt9j9QAh6BKZ11mus?=
 =?us-ascii?Q?qSQ0ALdDuPL5UXZrd0H0WzeraM7SO7+/Hn7AnAlpAmiy2kPLBXs42WZPh4sS?=
 =?us-ascii?Q?nqdlHiBkEr2As+RIaS9G+jSbr+Mb+JaVXE7GEaSqXbTwsaaWhC54Mx55TwL8?=
 =?us-ascii?Q?wH9IyN0c/aH3l+Zm3zJH941PqC9JBiQt1EDpqIj2t2pUynVVb02/MJe1UUZP?=
 =?us-ascii?Q?h8QTz34W6CUiHVjhkZmXqpu6IysXnpo3KK6POy0yR8D0rT+UtHAiG41njSP6?=
 =?us-ascii?Q?8q75mhcCPbyhaWdVxSIwcUJrRYGh8XhGOQIOVqgy3TD4DrCBZiNKGpemFBxQ?=
 =?us-ascii?Q?cWnojMiaslP8AkFMl1LdEXpE93Va5vjEvVbj4kssCS6xSL+wpmvZ8/7Bece8?=
 =?us-ascii?Q?ZGweiQEdh8P8HrmlNN6ZX40EaX5KojGhKoIe6gSMbrmom3WxGt1y7r7Ury9J?=
 =?us-ascii?Q?gY4ffoqDQ+8dbF3Q0ACoxcyXAe6ueLXXo6vZSxaXW1b+m6SCMVw9zs/JwszP?=
 =?us-ascii?Q?dWbSnavJkVOJ7cJ7yY4owQ/5ZfVAPdDBRjnwG1orZNUCqsrNvUAsvelT6AI7?=
 =?us-ascii?Q?Eb6iYFju/i4yY9oPWz80/vSbRD9/wuyGItOdpMFjhSWBOAm07UFkqncaOaT8?=
 =?us-ascii?Q?LiT5+Znc1M8U/YTGyGIUn7Fkbe2K5LiBGulRToHXJaxrmQ/VMH3H1xSZJeNY?=
 =?us-ascii?Q?A/6rpJwYMU6DWtgVNcG20OGyz1je6oyd76U93zRTlxGrWX/oqrruDB3mCJCP?=
 =?us-ascii?Q?JeMlVCPndupx2FFxfRomtQa4p4yVAbdp54NnbqoegMa9+wXmUKtp57iTfCrU?=
 =?us-ascii?Q?4zeyTxE+ADxtmoHtoitsDjPn0/IHKzFKtLd+KL1xJNHv8TPks7+xVic5Zf7s?=
 =?us-ascii?Q?MWj+PbKHuSFlCIWDCPZyP44MaxpGcitbg72ihSksdc00BFaaL40gO758+M+L?=
 =?us-ascii?Q?ogI/zDA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jA8B90hhHny//SOAE5+7LsCSrtEJzRDmy2kJ1CG4H0NxoHmeeRH15yPJ42W0?=
 =?us-ascii?Q?eOAcaSJAVFvz16FwJSw7K2XQjJOSHtOYtxKnmryhOTQKyTem9fC7H1ssiBr7?=
 =?us-ascii?Q?rTjqsCtX8Wi1qUzRCUAHo1lCacmyn92YqdkihF3hB62U7pc2s3ySUKa0o/xv?=
 =?us-ascii?Q?f8xVdS8EnkVsTf8gnPP6v/jY4gCdwbAptIVNEdNh7PaLqVJDOgDvbu2R+Gfz?=
 =?us-ascii?Q?b0Dn4+KuiZysqmLEPQ4UkJrQkYzdvTWdev8P1KV5NGLuP19ALDib0rXRhEZh?=
 =?us-ascii?Q?7AX8JIN+K6gFMvpl4t9XdE74J0bPB/tJe8ZDQVWIWZWVUyl4hUyH2uXCfm2/?=
 =?us-ascii?Q?KVIywRr9o0fQJknnm8iAfbzjTJW4HsIBtUIXxOnKaoFgq9IBojJH4b2aqUFU?=
 =?us-ascii?Q?NkESkLvNhAeJgTBCO5R1cdTPRXS3vyFvxlN2dSSHJZEGxPobXphMixtxfCBv?=
 =?us-ascii?Q?zSXu1OSYWw/Bws8ZKoC1C8f7Vz/3C/8YSIp93lkPeCwZ3gUxh/HTKx9lL7gG?=
 =?us-ascii?Q?sHPvcQCTk1hKbRdsKLQQdS4Fg2fW1ivY/z5YWKUdUg/n2s3ifAS45abx+CSl?=
 =?us-ascii?Q?oEbFsPOHHlaJlFsKk5r6uMr/CggCMDxeTmU8UYXoeCe9O46NNYjTWIpjm9fj?=
 =?us-ascii?Q?79+owUqLDfSitwA2KF47ETGTCHhW+pty2McXHrX3sQ1EUprJeer/kib+mfa9?=
 =?us-ascii?Q?zVdRh7LoBvT1DzTfDaDsts1mxiB/Glclnz6Gh9H8u/RHI+2Gzdw9Mn4vcaFL?=
 =?us-ascii?Q?9a2gs05TiOS8d3Cs1VuOdwIteB4dMg7nAqJzXafTcPst8/8qcJZOeEZ0epQa?=
 =?us-ascii?Q?0tB6xkuUFJDR9KZccOUARqfFQS6g+YTODj6ROY8ya2fKMz2HMKEncjj+YwgX?=
 =?us-ascii?Q?ZFjrkELXItUw4G19kGDBwrxfVsWMLqJpGqQNnFeIBsWjqg7YrEf3byS8gbSm?=
 =?us-ascii?Q?HklMfvOV8PfyA4CDD1DOjALkrhJZH7A+yealMqtHz1V6FXcF4/PY3wv+XfLT?=
 =?us-ascii?Q?MkAThQs4orZxdgXTuoqHUlB/1SOXTni9W7f+TOwilJdL/wjPpjJCwyBeXnkX?=
 =?us-ascii?Q?p5f0LQku6VMTy/DI4f2FNA6gUGTFwooolpfn2Nm+VycpgUWN0YQgbIErDfKK?=
 =?us-ascii?Q?nXqdloLZZTWwutkMejYHKbtkLO+8lAdNO+XCr6qK+T4I+sq/zQYNFZImcwzC?=
 =?us-ascii?Q?4nBSM6oE7zw4PMEp+dszZzlLVgBdhDALnt/wZ9CI+bOk198onUygnWqoArxI?=
 =?us-ascii?Q?gZ9d4TRH6mQCV5nVvzngiknOOMlLYl4TffXbyOpX190zImLX7VvoY2Gd0JAE?=
 =?us-ascii?Q?LSlabvpQAJabZLKs68IXe9KJeubKhPPJjq1qN4PanXSwegLwKIRue5uHCqqC?=
 =?us-ascii?Q?tVa9b6t6mmdogzRcH9//f4S4zHXqLu18R0fN5NXNs5ft9hVSCmTFbHQ2NujF?=
 =?us-ascii?Q?iFT6x5gm/s4huNLZj04xPOulOuelXIS9VLn6bfZ/XKa+ds8SHzgCkOxaH78Z?=
 =?us-ascii?Q?AeHwVa2sWl+RCMBkodYg7QABNse/8Yv8mnLXBgEV3kcq2EaBpfeXFF9uiDhO?=
 =?us-ascii?Q?PNSx1EPzet2xnKT+BVjxt32d8PKDIesjVdxlhhMkOiQLzp+X6RzCCAWNLCD8?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j2ymT3BzVe0mNGdlnhTeoh5z1bkdyn1Af+VGgW85v4/ub46OahdpxYkSXDNvC+9/DMHTPIOKJLKekCW5jqBXKqncPZaVOVjQwklsOMQfoqmdH1/6G0e+vRLy5ooDtlVo67OiMn7uobWBddt41BgscAIsuVl6vvEv79I2NAixeNHTt/QwI02Hq3WFHPdu7Wf80QpN3BzAteoBMli5kqiy4eWmOxkASR3nPo7b6vPKVipjmpNg1+37uv0c9im7Ua0w7yOWXPZFx2rFaaSm5l/RT/Z4etNazkrZIlrGD/OmMYnmfDstQv20pUbUrREJaV22G+CHR403C7d2xI/HheImufpc+dTdrJOJpJYOVjX00h8NaOtb00v5PzhOCpaHi16UQkbFpVTqh6rNIIbyQFQpP/jaQ+KeStoEx32y5oqgss1XKbsOSF7dpoGownm8Yz6225aowGRNWciQJH6nbRkvoSNJukz8KXFDII61fVS9A3HhcBbEn9kQT3J/0+5tcCyPr8ksxS86VnwKmW9p/wDUn96nxmkT7FXDt+7KAfO0TbxILJmLDSvL8Bd4oE5NYPY4FlEs4w/LQs8C5gZFHIC2Fve1NlzfoO9t8f1B9We+GDs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67132646-562b-4d02-f7ce-08dcb33b28e5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 21:36:25.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhT7QCAnZuMpZAjdn0tS8BmVUE9Y/6kwcl8prfVAIzjhkLsvpsl6DNhpdjfvinsoBos2sxRKUYMKHbEwlDwPMjEo9vbV2oc8xHADAOJhPOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_17,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020150
X-Proofpoint-GUID: Xpc9pAHoC3xaHn5GwIFG0GkiZIrJZgez
X-Proofpoint-ORIG-GUID: Xpc9pAHoC3xaHn5GwIFG0GkiZIrJZgez

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

On Fri, Jun 28, 2024 at 06:16:33PM +0100, Alan Maguire via DTrace-devel wrote:
> sched:::on-cpu is not firing very often versus off-cpu.  It appears
> that - for recent kernels at least - fbt::schedule_tail:entry
> placement is wrong.  The only way to efficiently ensure firing in
> the right place - when the new task has been just scheduled in -
> is to use fbt::__perf_event_task_sched_in:entry as it
> 
> - fires at the right time
> - is not static, so not subject to inlining or other optimizations
> - is stable across kernel versions.
> 
> However the downside is it will not be called unless context switch
> perf events are enabled.  So the most efficient method is to
> perf_event_open() such an event but not attach anything to it.
> Also explored was attaching to cpc:::sched_switch-all-1 and weeding
> out off-cpu events, but that required a copy in of task state,
> comparison etc so in such a hot codepath a more precise attach
> is preferable.
> 
> With this in place we get sensible on/off cpu numbers:
> 
> $ dtrace -n 'sched:::*-cpu { @c[probename] = count();}'
> dtrace: description 'sched:::*-cpu ' matched 2 probes
> ^C
> 
>   off-cpu                                                        1454
>   on-cpu                                                         1454
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_prov_sched.c | 48 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
> index 2749385a..3e9d4f6b 100644
> --- a/libdtrace/dt_prov_sched.c
> +++ b/libdtrace/dt_prov_sched.c
> @@ -9,6 +9,9 @@
>  #include <assert.h>
>  #include <errno.h>
>  
> +#include <linux/perf_event.h>
> +#include <perfmon/pfmlib_perf_event.h>
> +
>  #include "dt_dctx.h"
>  #include "dt_cg.h"
>  #include "dt_provider_sdt.h"
> @@ -25,7 +28,7 @@ static probe_dep_t	probes[] = {
>  	{ "off-cpu",
>  	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_switch" },
>  	{ "on-cpu",
> -	  DTRACE_PROBESPEC_NAME,	"fbt::schedule_tail:entry" },
> +	  DTRACE_PROBESPEC_NAME,	"fbt::__perf_event_task_sched_in:entry" },
>  	{ "surrender",
>  	  DTRACE_PROBESPEC_NAME,	"fbt::do_sched_yield:entry" },
>  	{ "tick",
> @@ -141,13 +144,54 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	return 0;
>  }
>  
> +/* We need a custom enabling for on-cpu probes to ensure that the fbt function
> + * __perf_event_task_sched_in is called.  __perf_event_task_sched_in
> + * will not be called unless context switch perf events have been enabled,
> + * so we do that here by opening a context switch count perf event but not
> + * attaching anything to it to minimize overhead.  The alternative - attaching
> + * to cpc:::context_switches-all-1 and weeding out on- versus off-cpu events
> + * via a trampoline is too expensive.  This approach works stably across
> + * kernels because __perf_event_task_sched_in() is not static, so not potentially
> + * subject to inlining or other optimizations.
> + */
> +static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
> +{
> +	struct perf_event_attr attr = {};
> +	int swfd;
> +
> +	if (strcmp(prp->desc->prb, "on-cpu") != 0)
> +		return dt_sdt_enable(dtp, prp);
> +
> +	memset(&attr, 0, sizeof(attr));
> +	attr.size = sizeof(attr);
> +	attr.type = PERF_TYPE_SOFTWARE;
> +	attr.config = PERF_COUNT_SW_CONTEXT_SWITCHES;
> +	attr.freq = 1;
> +	attr.sample_freq = 1000;
> +	attr.context_switch = 1;
> +
> +	swfd = dt_perf_event_open(&attr, -1, 0, -1, 0);
> +	if (swfd < 0)
> +		dt_dprintf("open of context_switch perf event open failed: %d\n", errno);
> +	else
> +		prp->prv_data = (void *)(long)swfd;
> +	dt_sdt_enable(dtp, prp);
> +}
> +		
> +static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> +{
> +	if (prp->prv_data)
> +		close((int)(long)prp->prv_data);
> +}
> +
>  dt_provimpl_t	dt_sched = {
>  	.name		= prvname,
>  	.prog_type	= BPF_PROG_TYPE_UNSPEC,
>  	.populate	= &populate,
> -	.enable		= &dt_sdt_enable,
> +	.enable		= &enable,
>  	.load_prog	= &dt_bpf_prog_load,
>  	.trampoline	= &trampoline,
>  	.probe_info	= &dt_sdt_probe_info,
> +	.detach		= &detach,
>  	.destroy	= &dt_sdt_destroy,
>  };
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
