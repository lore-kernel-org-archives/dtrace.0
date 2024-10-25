Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D119B59F
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838079; cv=fail; b=jgD8WF+1s5mB5qJPX1ycM5W4ij3ubXzsvgmAmw7fgZX+h5OIC2azdHAjGWuQCLnKW6hukqZJG4EjhogPGUxJm0GlXJEKNsffpKaNxgfTTAXQvV2208ZhxtqwTQX9Yneeg7M99a5En8iOxg2VztftGf2FEYm5Vth1CI+S4NZq80Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838079; c=relaxed/simple;
	bh=MeoY4xkLg+BDYSpImwsA5DUSB66T7jEaBzxTGJOxKIo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=md0Xe0z2jGGK+xbkFddsAFIWrx5EmcIiMTQh+SwWJlCmXcKmKHPZRAQMZaX4Zi0U9B9P+W2cDCFNYbw8P9LoVBFOQu7xtjKf/4fhLgCabx634CwaVncDRCHGtFfiP0iHEe63Qj9wnPm6EcIK/ieBei9V3+YE/h+UKWPTrCysGHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Iu50iz+T; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u+wXf6Mo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Iu50iz+T";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u+wXf6Mo"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2feRf028401
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=BFTfIiy9XlsDm39cOg
	XU+UmQx25i0BvanaWpCbvOs/E=; b=Iu50iz+Tt/UCXMx42XLMfrqAhZEQJ7uRqY
	+28/Z+MZbSuYg2CrtTxtwJ+08fooqMDPC0Pq6Nq+n/+MG9j3Ury3brCR1/WDnQfm
	xRNALsVYCuZ+gpWn7UBJxucNu5TY8AXgwaS9BNZB2LKblaR7jWs9lPcXGc5wXy2k
	q1pkI5L3Y/BzrPOL4AebZMwBgZKQHZ7/nW4W8hhtuBJk00nRYMrIX+UFvIgI2Fe7
	hwcCVndc7vOnKGW8K5jBnC88LTmbuvMQciJQ3TJVL2RtziKTUhaJWgQlSE2ayQ1r
	EUgykxmCq4rkaT+Yfl18XxKMCYYUoj2UCqvmJILF0u2EpTXJr0Eg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asm9wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P4rtOp027393
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh5byjy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbRFwe9DNTj83L0DXlvFuZpLhPrlG+L5cXHfC2UU2YCH10DdPA5qug+FKXYENMxdrrHa7wXHUKdEra589yPC35ym1S8jrEXXeiK4NN5MaBLfqghlwAb/6alSV1CNw590jlNQRZuTpfJ9GzNj1Dk5haVX4+gDauQoXIy4GEaFfXsPel2Hf7/zk8GhB7SkoAifN1Gp1KblRxSw559UAjRQvAr6/7eproLy5HvlH1z0/T+E8orwFashC2Lp22MpmOdUtrbWWLPhORriujdD1izbb54zZruI1+xHYFb3vvf+gSHwoeun5lsX4bRWyODGLbNyLaRiCNJFLsqMfSuaitM/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFTfIiy9XlsDm39cOgXU+UmQx25i0BvanaWpCbvOs/E=;
 b=xujnRoCpc8LXXHaupP+M7Vo9dfK8ZOI+qe77v4zsOpkKsg5Y0C5AodXYYCcnl+dC4qnm1XyoLH6kNpy+t2lEq2KejJC3zazBE89Y90mMGOvlOB2v0zEvMQiJZeX1BkUOG2uoMLbtHNWFr3F4D9jLPMCthxu6poerIt75+98pBzVt4TigNktQiEHMeLJmI1R4+QuBD1W9G2VXhBWCkZmi6TBuQUzIklD7AhDER1IOqxseVbddpSb0tfVQCu0E64YM9aTXVu1IvhaWLVejlgj3IE/x+zduwFHyqUWL66eL1kusLZKwvqpZ8e2xhRfkSnoWhhIBBxfY8Ivul4i7Y8AJtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFTfIiy9XlsDm39cOgXU+UmQx25i0BvanaWpCbvOs/E=;
 b=u+wXf6Mocedhv5e9W2yOA06slbh5q9rs7Yv/S+EuFavz+LEcXn6uvLHD1AlMCw7JYPAKzJEva0OfF0d1I3fZeQ+FeuNg+w3VOmK5L/Aej89Y62UoaRPL6nlcPBgD+VLDbshv9ZQiQPcd7CcgBMJxqvbLKJXEF3DbAw2jN2q3H8U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6532.namprd10.prod.outlook.com (2603:10b6:510:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Fri, 25 Oct
 2024 06:34:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 06:34:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 11/19] Support USDT wildcard provider descriptions
Date: Fri, 25 Oct 2024 02:34:22 -0400
Message-Id: <20241025063423.20479-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241025063423.20479-1-eugene.loh@oracle.com>
References: <20241025063423.20479-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0031.namprd02.prod.outlook.com
 (2603:10b6:408:e5::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 8939c014-e80f-4c6a-3447-08dcf4bf13f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7izHzdI2+ksXSeQpnmYnVdW4HlJBHfyhoZ5PkNST8eSA3x4pqJI96YCJVduJ?=
 =?us-ascii?Q?OGp9NPnkjcyz3vWEAIljv4aN1ed44VsP7IsVS4aR1LFt+yPd1zLx5ic2DF68?=
 =?us-ascii?Q?2Py5eFKkEfVNFCwc807HkRZTUtur2vyM/j7h9b9mvCvVUAInv8NQB5YxyEUQ?=
 =?us-ascii?Q?UH0biLsWCCWsYQD08+ziVEpSD1h8+lo2XUfIaJZ68Vw+ApiOsy5JNLuDqunD?=
 =?us-ascii?Q?EdnZp25IQXR5ffwlEOaJ+THM/FfEDbCj6KLKWpjE808zMYeUbZrqYz5azISb?=
 =?us-ascii?Q?y27QV0aYFNIoXNJTGDt4SeqqG/gQzYoeY0iT/+CKKPAsRypNc8sw2sywd2F4?=
 =?us-ascii?Q?GwETblgRIJNVoDc6TneoU9P5DmnkOT/SWejEsGmalafOpA3Wme5gdOsA/pzq?=
 =?us-ascii?Q?rsdPiXWl8jAKP6u20oTrZl7KlQ4zx9dDic5FWTTqV6it8beQAasa2uE2/jP5?=
 =?us-ascii?Q?epbDyIfg9ZIZpxNAj+y6c0euFJ/0zN6s9JnYbTAVs7DbbcWqjLyFmAcTTI2W?=
 =?us-ascii?Q?8n8p08AxqqP29EpQrnUFVk3mdKHVxhk1mNnA6v5Tp+FUOzihIgUBO0V085UO?=
 =?us-ascii?Q?Ls+bzh24UcCo4HsnN972Niqz7aKQ3pE5hMQjpNPPSmXNl8yb+gL07TaB+bah?=
 =?us-ascii?Q?Zn/fyQ1IKLZGNB5KoynoqS6EYOgk+QBdCJHiq2/wxM37EyCTnYfxO6Rxcs5e?=
 =?us-ascii?Q?8bPnbNqg0Pn1cTVDYNwRlN1aLTNiiKK+S4HJvei+sm8gMtooG7Tp+baUil9W?=
 =?us-ascii?Q?HJXLPG4U5YVIbyBxmAv2MktSvWPy+mrYPSaGb8Bl1Bw9/7vEnYH57pKo6FzU?=
 =?us-ascii?Q?S0K+bCW5AuaEudtuB3CtF9dDe3CzZ6zuKUsBEJZY5gU+GU9O+1VQ31ULNUiu?=
 =?us-ascii?Q?sOCqdpIOKvx9wRzvjTTb23KEYnkEyhMX30zFp3VHeDZg3kJqArGsrLqC9N7A?=
 =?us-ascii?Q?QobazRhkgaCO27ytHxmkWVquyG+B6XqePPRK6XQ9+POzGBX0qY2BGEBdRsRA?=
 =?us-ascii?Q?SMZFoIqA0WMdD4li/DvkIXZTREk9m2xCeJ5lmzOSe2obZy2PUrohBvy4UYzh?=
 =?us-ascii?Q?pC32O1RmKAob0TmO4MiUfWRADgxasaTRA39RpoQ7FEyQy5sI111VWomQgVch?=
 =?us-ascii?Q?0o7HN2UZsoVC8GkI+vKnByGhmuecOBcOqZY78BEvMsLIfFETYvtLXJcRzjyY?=
 =?us-ascii?Q?NbsM3eb0AiCTKJneA5rM/+0z49eMUNXlc/VIeErEySRpZ7gIzcOPVO3vg96i?=
 =?us-ascii?Q?V57QEiOQrFKQxJ7kMda3v43nx3RVKXoCh6anuIRQ38KhbT4sEieAZcsq+yr2?=
 =?us-ascii?Q?zgF8U2kZeOV9BJGeBNZeWG87?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5ksIUZ9Bz34wg0sfBG+tqxOSZlo1v+1uvPoIBAkXdKXvb8MRty0EIEuL5V6D?=
 =?us-ascii?Q?Ak8tfrewayXMz1bmhFFM8gbxI06ozJB2UFr5uWKGz3a5AF8IaWyq/k+YfXgp?=
 =?us-ascii?Q?cHzlpffP81Vvuyr10KWSLm1m7uJA3vrE5G3NiQdGD9gy3VhK28z4Fp0s4Kmw?=
 =?us-ascii?Q?HJZgg3/pC8yxWwTvLUrwbkPWBE/1A+HJyrR73iqorqNOIe3tuPKzsemobVB2?=
 =?us-ascii?Q?djOEaPILIYs6rNlkq3Y3QOu+1S3XrhJKqd3u47o129GeV5X8S3aOQJMv7o66?=
 =?us-ascii?Q?ZWq2FM/NCJmYs3VHcJIeYjQzeQg8Cj16maGPkU4aXIJrvsnzhLac2kBfHN3h?=
 =?us-ascii?Q?ZjYr0Zdm6qZDM9PIXalXM29N2/ZiO2wjqRDxB9r85mejuuFvrgGawFj8i0du?=
 =?us-ascii?Q?0OAIcTMNjUFOsimN4iZ8iIrUxCnioCf8RVzyfG40yIjbfTILiJ57Ijq83JWp?=
 =?us-ascii?Q?tfjiSoXn/VD8q5q87Git/58joaVPJEAT3kBxkzWWnH4SpYYUV02E0iqXWg8+?=
 =?us-ascii?Q?DIr8qMZUp3y+jDTiaDS+hPooru0mEPwRkeyVQAbDAfgmzRIQjrhOZWz53f01?=
 =?us-ascii?Q?wBiGHJvfD/9s+ifDZH0xqTINMxy49INWBtW2imp9H3ATb+iEDbTDLH4WbHhw?=
 =?us-ascii?Q?92FVRbBuwyATMkJOgjP2fjt3GWpGxb3prXt63swDDIBIIju6EQwo7UnFurSO?=
 =?us-ascii?Q?0fA7FFVfQeuBZXT8Q0k4FZsQQ5WY6UH/OyiT0vO0I8xuWXahiNC15tmW4gEj?=
 =?us-ascii?Q?tMSMIzr+PAMiegTNzZn6o5PhOwX0ocfaAhY2m7VnN4kejFtp7IT0x/+HDQEt?=
 =?us-ascii?Q?7ddzq6GNMvFOZX0d6sMk3FEEaR+gxXWkBmhKcAv+R7MNLWb3H+AVWcmZJG2H?=
 =?us-ascii?Q?nLuuKLecDo5ZAWgTMB7ONNrzthF4iA7NAEt9cYIKZs5rsMemCcQRitc67O+W?=
 =?us-ascii?Q?boqHtLE1eoanQHciKW8BqDcA0Ad665B8JvkPA5VCyAK40pVkhIJL59SZh6/J?=
 =?us-ascii?Q?1kLEaRVeuYuGT2xkPyhgE/LL3gjcgS8BGMvnJyPwXCWppIA/qJjqXr3XTlpL?=
 =?us-ascii?Q?A8KFdgmCjHvyImkecGD41Dmu46VN1ciJpyOTKmKgFc5ihHtFVgmGhfCK9U4/?=
 =?us-ascii?Q?dj4JU+KC9rT+4zyZB9WwhSpAojkPHi8j24PhlJ4zQoDZ+M2olG6u2Z8Mf2h1?=
 =?us-ascii?Q?CcSrsvoTkwT55q6MLWkrFWB6qN3cH+8PM3JfeYkCZzk3O3LcnVKf5jGKz30W?=
 =?us-ascii?Q?kILDGO0TRtqPYHim186FrlGXrHULAfW/5RrLASmn3Sdj+bywwIkjo7umsyfm?=
 =?us-ascii?Q?ykxFimG1wbZYqJUWB0NVRn/89MMSnao9z+kqfdt4Wlqx7v1HATdCS1zpG4nk?=
 =?us-ascii?Q?zkqgkfP61KZ2pZhanfSyMnepm5I5EDNg/PnMpbrpiyMDFKn2Y/e8mdeBw6C0?=
 =?us-ascii?Q?It3XkpwBUib0ASGTC9xoFeDvVf2Fkc+SWrSw1Y3HR54ML/xO9vQvUDhgerdv?=
 =?us-ascii?Q?R2sGepzA8yZTijAUEoQvaFd3M2QKVaSP2o/RLiY0C0rxBq0OgbNUSkox63m9?=
 =?us-ascii?Q?1rchCzjtfDXLoES63qo4xOgvK/S9epee4E45YcHQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2xhAHOO8Q5HE9he4fl0o0CJ6uka5OGefmCj11wA1AxgujJBGyjXKuc3AwPUUw840Eom6kPtAiTWUo70eVaGjGC5UBUHvEwWiUIrLVqRMO6fmGfolictcV8QaA0R5M/tQq8KMCHVW8ocIkoq/09I2JVNkncx2o7ggMuUnSm3NppynZsdU6NbfIkc+/nfB2LtSvCAOJIDukgA1RVvW/67Lems4E4yL4QXPPLFpEZHOzFscNvl/E7TVSlUP+9nsP9XhvDV8e8l7bE72sxNXeG2OgIIro+1sWy239nr/hAgVB0OJiZRkOM0JP758aG39EutzpwQ/+a9dx2ieJbIQPF2955PaFE/Cs89+jLwRhL7KSkw3n2/WBJ1kD69Eb3KSLDq0DivsnpZ28Jkc1LWAi8ZnCOVMixq8qA1ftMfPdI4XcTHhXO5J3AeRBdoqKYugrIEdJfsgZf+GhuGqeBDL8WM3zr6ST605x0//cNpPZ9gE5wPwVl1vbzE5+7iWvoOHmEdCG1lEahRav8y8vFQKOerR1hSNgG3trl8Vbhtrd4iumtjEYzjaxZ0wmvmLYUeVus1bXOPK5VIbwh22zR0261sfCVOQrNGWxtFuTOFaHFd1gVo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8939c014-e80f-4c6a-3447-08dcf4bf13f4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 06:34:29.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2hFcRHI8OVS0uyZro5q1R2YqOWWg45mDmKC4QldbTa6sWl/lpeiK2zDCr+y5A3etV735mUGXOZJHm/Nst2JYug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_04,2024-10-25_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250049
X-Proofpoint-GUID: 55cFgDBBNwH0RQNhgkD2IeU6UYNhqH6B
X-Proofpoint-ORIG-GUID: 55cFgDBBNwH0RQNhgkD2IeU6UYNhqH6B

From: Eugene Loh <eugene.loh@oracle.com>

To look for pid probes, whose pid values must be specified explicitly,
we can require that the provider description should end in a digit.

For USDT probes, however, there can be wildcard descriptions.  This
includes a blank provider description as well as a description that
ends in an '*'.

So, get rid of dt_pid_create_probes(), replacing it with
    dt_pid_create_pid_probes()
    dt_pid_create_usdt_probes()
calling each one appropriately.

This is rudimentary support.  We still need to:
- handle globs in dt_pid_create_probes_module()
- add process monitoring / inotify

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c                               | 17 ++++++++++-------
 libdtrace/dt_pid.c                              |  8 --------
 libdtrace/dt_pid.h                              |  4 ++--
 .../dtrace-util/tst.ListProbesFuncUSDT.sh       |  1 -
 .../dtrace-util/tst.ListProbesModuleUSDT.sh     |  1 -
 .../dtrace-util/tst.ListProbesNameUSDT.sh       |  1 -
 .../dtrace-util/tst.ListProbesProviderUSDT.sh   |  1 -
 test/unittest/usdt/tst.forker.sh                |  1 -
 8 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index fa16f8e5f..eebd923ce 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -262,24 +262,27 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	int err;
 
 	/*
-	 * Both kernel and pid based providers are allowed to have names
-	 * ending with what could be interpreted as a number. We assume it's
-	 * a pid and that we may need to dynamically create probes for
-	 * that process if:
+	 * A provider name ending in a digit could be for a pid provider.
+	 * We may need to dynamically create probes for that process if:
 	 *
 	 * (1) The provider doesn't exist, or,
 	 * (2) The provider exists and has DT_PROVIDER_PID flag set.
 	 *
-	 * On an error, dt_pid_create_probes() will set the error message
+	 * On an error, dt_pid_create_pid_probes() will set the error message
 	 * and tag -- we just have to longjmp() out of here.
 	 */
 	if (pdp->prv && pdp->prv[0] &&
 	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
-	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
+	    dt_pid_create_pid_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0)
+		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
+
+	/*
+	 * USDT probes.
+	 */
+	if (dt_pid_create_usdt_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0)
 		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
-	}
 
 	/*
 	 * Call dt_probe_info() to get the probe arguments and attributes.  If
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 62060b592..35cf73ee8 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1207,14 +1207,6 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
 	return err ? -1 : 0;
 }
 
-int
-dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
-{
-	if (dt_pid_create_pid_probes(pdp, dtp, pcb))
-		return -1;
-	return dt_pid_create_usdt_probes(pdp, dtp, pcb);
-}
-
 int
 dt_pid_create_probes_module(dtrace_hdl_t *dtp, dt_proc_t *dpr)
 {
diff --git a/libdtrace/dt_pid.h b/libdtrace/dt_pid.h
index 9277c6bc0..c35adc2c0 100644
--- a/libdtrace/dt_pid.h
+++ b/libdtrace/dt_pid.h
@@ -16,10 +16,10 @@
 extern "C" {
 #endif
 
+extern int dt_pid_create_pid_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
+				    dt_pcb_t *);
 extern int dt_pid_create_usdt_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
 				     dt_pcb_t *);
-extern int dt_pid_create_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
-				dt_pcb_t *);
 extern int dt_pid_create_probes_module(dtrace_hdl_t *, dt_proc_t *);
 extern pid_t dt_pid_get_pid(const dtrace_probedesc_t *, dtrace_hdl_t *, dt_pcb_t *,
 			    dt_proc_t *);
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index bd0552dca..99ae995eb 100755
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
index 7b9c6a5fc..5ae087fbf 100755
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
index f9b1d8bf8..5c0509d89 100755
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
index 644da2ac2..6eae82ed9 100755
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
index 7cfa9eb5f..92513eb5d 100755
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

