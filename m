Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4032F2717
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752663234; cv=fail; b=jylRnQExzWNsV8axSSN/j3EIdyxAH3kN6s22NIexCKQ1OTtqjn/MWkO8Vl06Ej+dFrayYao2LIeddL/LNNOqXLp+GmKh8w5BW9wlEVG9+ERqXukyIBST+UyMHdPZCihLtDmJvtOoEXCG+0MW+SMblZqpaGq/dGjl9r8nUblqsXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752663234; c=relaxed/simple;
	bh=Yt3TLbKteqfnEk3DwPgegV4LO7GVkRjfpFWV4EB9zeQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=eBniB//hiKhXtwseor4y4JqZGw/bC07NlysmtyDmIZbocBXohGJtlhpZjm0WG72QtDqegZ1eyzhsKUm0bbIWZkt3feaHqOgNEcAHWWDq3DLt+WPmobTzfEb4hMBP0SwlrBO/i0DQLbzc2NtH80OqM/ODmQOxsr9fmFcyssW7BQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LF5zxYA6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dJT6FT7j; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LF5zxYA6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dJT6FT7j"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G7fnmF005464
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 10:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=CHFgLdCslmUS8VGfhX
	7KsRAi49/7f3f1qr63SuBsotk=; b=LF5zxYA62icdry7JdDsW8yeT6ZBGVz2gRO
	elH99648L0MzH9uqf3AQAB2i6YichFX+sxSxwfmQ63hxZBdQ/feBaC6TzP3P5o9N
	Asavrj5UJEKIz928KcuxIkIcQRvz6XCfiAXuMbWDG4qYopEgPWxZE0Zj20EmU58a
	6EfZAxVl7BZa4hZefhIFQ1ds18RghmSs2qUZ7QJl8E7YFluxhk3BZSstZghiElLi
	1EhN3XKEoX79j6SwAui9CTvnOg6mLjktmrRmH22XuzZelHxp+TBfrGFXjb0CQtwx
	JX0N+lRw64xno4YnoR+0b9eHZ2muwJAEnv5kRwgfBjeKXB8Qjf5g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8g0qbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 10:53:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56G8iRTn040497
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 10:53:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5b7buv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 10:53:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti7b8Q6hGyt4CYGSx6hY7TL/5tvgDvh+EMndS0fHJN0LTwUDmL9D4B5Dz+H/webeAFEGarmSPZGStAYOKX8X4cm0smBYI8lJuZIvoExGe8uNYXNb0LbBsWsGiseWcRFz2zYon2HFpqXfd8j/7i7BSOZTNbTja+PVvgdPVIwEmvnPxq2GvPIHQJdhsjphWXFyRCaKBbvh4kX4t3EBUWhHv1N2E+YVfeI/HwqKtapgSV0ZU4GkWNtSRlqR04pI2JW2fK9oNM98iVVWDIxOva0oGmJBZBXoZQ/VmF7sazj8G0DBVaCq1ehw45PHzG1emOtCV1kt/egkG4ik7d30wwZyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHFgLdCslmUS8VGfhX7KsRAi49/7f3f1qr63SuBsotk=;
 b=wzA596C40+mre8Ju1tgAMzoPrbxX+MkVaeG9jd7R/zIV8hjYxTcQWBVE0w4FdQNKpjD/10idN72KtJVzKaqh+QPOTdPbgwjhj0C54dL80A4TlbL/MFYJR2tq8uQhhHCmXEZpdkrYwn4a2/c7cpwpKyGVHIRn/PJJ34RYs4/Dw+zWj0Q4zz/Uw8ACpv/akRLd9B8UgpZ4Z4xs+0L8YgaDY64L9Eqrqizl0k2iTjp9Vk99Ms41cjAY2MkH8eivdUIufbS3x8hVkze9Go7LtcquTTH8DixIWW3xMZMhRL3LZO4ZLmXUtUiI77ufdfuLYSWa1AtVanhcrfDfuYO3KNd65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHFgLdCslmUS8VGfhX7KsRAi49/7f3f1qr63SuBsotk=;
 b=dJT6FT7jROWMyYBau+n4GTDm8JqMUImGJfkBz19TYcwnxWMYsHbCVHrKa/QuRVekPeHnehr0xg5pX4fZRlGy7MkeLirXhYFYv2yt/L4Y4i0bD60i8M3WhiUvMvRjOdg2feDY8oOqT+KOSIQ7HUKcJDORyABIwIangGcncDQEkns=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by SA2PR10MB4442.namprd10.prod.outlook.com (2603:10b6:806:11a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.37; Wed, 16 Jul
 2025 10:53:48 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 10:53:48 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, <dtrace@lists.linux.dev>,
        <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH 2/4] provider, cg: add reject_clasue() callback
References: <SJ0PR10MB567290541C554B9145DB3181C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	<87cya1wxlg.fsf@esperi.org.uk> <aHZvdMdtZ2DU27TN@oracle.com>
Emacs: The Awakening
Date: Wed, 16 Jul 2025 11:53:41 +0100
In-Reply-To: <aHZvdMdtZ2DU27TN@oracle.com> (Kris Van Hees's message of "Tue,
	15 Jul 2025 11:10:44 -0400")
Message-ID: <878qkoqudm.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0561.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::10) To BN0PR10MB5029.namprd10.prod.outlook.com
 (2603:10b6:408:115::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|SA2PR10MB4442:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb2b21c-5eca-4537-76a7-08ddc4570acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bAo18t8TCCmBSbPnhi0Ln3wrps43lHhsQg8Ueeiy22pVZph06MQHEHp1He9q?=
 =?us-ascii?Q?8bJCrL/y58DV9YZgWDwH450/lHg96BLO+ZsDUqtKw5Maz93hKheAnViIrGES?=
 =?us-ascii?Q?59n9K/1ryQZGGOi4UX4jMDvdOaGiugrXrdzc3svTFSINyNQbGk9AC20B9q3n?=
 =?us-ascii?Q?MEGuO2qclXTmIliJVmlshUOjn6R5asDJ1HIWe7nWhu1ZNA+A1v7bMpyZnvvD?=
 =?us-ascii?Q?xrhmU40cBnmGl1WfET6/KYmw0hZBX+/fyMRroivVM8K6R979EhA/AZPhu8Ko?=
 =?us-ascii?Q?NyYSbCRwrky/bMLRV/4zl5AqZOLUI4mtyZPAZImEz7Bn1SFr8gEf35Q/awKx?=
 =?us-ascii?Q?6asYcX7MPu30XO5XTBwJkpAzFUgaviPd+1tuevkVH72JcHPrAJ/9TwA5RkG0?=
 =?us-ascii?Q?/ie7lsn4EeqayaqAHJvtm0wBK3JSRJaBKu+zEe6IgUD55tLsEm1VNrrQcXpA?=
 =?us-ascii?Q?3JDRKxDI93WUMmHWIk6cf/O0amcOy1JNnJi7iMVmSq8mdBHrK/0KXCARPEvo?=
 =?us-ascii?Q?KecPLNFTmfOlK8kV6aJeUN8CtPyAnWQUsqLQck4d0n+OSJAr9DzDXPEQyfK/?=
 =?us-ascii?Q?AEIkeT56PISOAKKIehoTyG9MO44jdkDKmGMdo3p/K+V/iRLLhVuxE1jKUjt+?=
 =?us-ascii?Q?KlLD2+uji9VrF9rY4pIHr5usLsocTucogJ3dPTiswNzfR1BmiZP5y0lFX8Kh?=
 =?us-ascii?Q?Huh3+dlBePAGBe2jbYt1XVny0zS31MJ/oPI6gHl4kWHrI4wHW79zVyPtc4Tt?=
 =?us-ascii?Q?E66bG9hUXT+9jFw3LbqGLtWYimFZlBPQ8k8YerKIqeb+XDCs2uB3DJALq5JG?=
 =?us-ascii?Q?HeDDOJr7QvNW+g2LsfOhlt74IY6M03E5J+yjDuaTej7LTTr5l8qYMY9G7Qy5?=
 =?us-ascii?Q?lr55Z4cL4ZqEmnO3E0seuB4s+C79bxdYvRrvv6qYjF7fa5DN+SgrRlOAUuQq?=
 =?us-ascii?Q?EQIut+wKjyjhNRYAZFwts3crK6N5zqXAi11nSYoidz5q+/BmZe6v8ykWlMcW?=
 =?us-ascii?Q?ZYBJKV4+SZey5rsTVzEzfNvBd8vJgVjbS0W9+QKQUnJu2upL8PPtDnXAWPLw?=
 =?us-ascii?Q?vfoihG5AROQpW8EFYL9iBevX2WZfwIQL1x1pReoG7r6l4gxDvw0YYFfHmliV?=
 =?us-ascii?Q?Kal6CpGUUe500JkmebPM5FkiF4/0gCpoHHvvu9G+PIAkkQBQ8n3NrwYC0rN2?=
 =?us-ascii?Q?axpo8fAZHi34GSqS7ENNjp+q3vaRhbZksM3cHZo1ecOSny2jZIFNCK+cA/5J?=
 =?us-ascii?Q?K4GwAcKqDMFjTnnFbPZuTNUAq8pbQRKZOX3x6jDneFc1i7Ad3Wt7inLDhqO2?=
 =?us-ascii?Q?pYZyS43iJbJ+dBC7UCAqD51Rcpi+XdXqx4d92wx8PIqqUEL4iYyXuY8AQZFz?=
 =?us-ascii?Q?ckChpScW1bZgaawb+aYf7i3Lq9GL5yAVVBCqEBqyEeKNpNTvRWy3KLPzH8FG?=
 =?us-ascii?Q?ezqYIVfiMiY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z8Ks/oEACXct+3JvP03bMTIRPp/ZlnfSz5t1Gi7ae/jQ/DEx/IuejOKkfsLv?=
 =?us-ascii?Q?gaKq1IUhnuEKE00H1LqfrJa5TJGt6n1hHWqln2fbzs5J4NJTyRPmacNPy2Ep?=
 =?us-ascii?Q?UGXUjjKcKvogR/0ITWDNQN2CQmcyro0KbLE6WbgW1OojuZWgBp+/YeI3RMje?=
 =?us-ascii?Q?O0qucbVK8726xxignS1X5ujsdEFpdtAFImF/UnfPjS7iVfQp9VHptB01FvwT?=
 =?us-ascii?Q?+59AjB0G05QHcIGpKSKRtW2TTUbpkWE0m0nvn1ZdSW7OEaIu0tVBlfApT1zY?=
 =?us-ascii?Q?assIRKmv3ikCDFF9PPskpw2MJa9f8IItyosXeY+HT6eCLuHeMXglWppcIgoO?=
 =?us-ascii?Q?LVPtZignTKsPERQiIyFMn4uI1SzLEhCMWp8EDgwyyFn6srx4wpglW5hZT8ZU?=
 =?us-ascii?Q?cRXz4FkqY2Y6cvsmBI4rUcNqn3Y7oCftjJPeRvfF2fvnkrw+Nh50v0V2Xd9g?=
 =?us-ascii?Q?6rrAz4eRkWBGD5u5OA+xss++f9Vk4daR5rBUJfFki4UE2udjFUHKq8RgpBG7?=
 =?us-ascii?Q?SQSVjk9sgPY3U/QFQbDV551/TdltS605y3cQx0ra3R6lKwSlqnxi1USDrQHj?=
 =?us-ascii?Q?yHVpYNcRbLVGTBzGPMLjvYUKgqcOwRFXTZb7xOYEdO+RcUzSNH0gdOaZRgqi?=
 =?us-ascii?Q?PLkKPKIAxwbJJdAXJNzTTwKSUc9rcjz/j/LPMp3/V62fPDZ9LRC/VachxAPK?=
 =?us-ascii?Q?3TIydADNfEzGLnguOKzRWnyp2RMDVseHUK/ZM6R/T0W5n4/8pe31r7vyxRWk?=
 =?us-ascii?Q?jRqBqnIWiyvCpVkCxYqR8r1vvm68Qbq0CopizxEjyUjRyRJVg7EQRMCz55yD?=
 =?us-ascii?Q?g82BbWuzQVC/vs8KHfb2r7bjvrM5v1IyCbrRbEwdQiyK0I/pkZJVbC6GweYb?=
 =?us-ascii?Q?SoGbXXKpKusSQ1SFsh1UrsQT2UnpknJ2ZkyGfHL6raugbJv8Wp2gC7bDkdRL?=
 =?us-ascii?Q?T65sET75FOj22Ox9x73mTHMsSzxXGiLVQ6Gq/4+XFTgzMQD+rvSmgtatT7DT?=
 =?us-ascii?Q?Dc5s41gkeFcLOSj9lGGnkfctbEl8hFYWGO5iEzVXg2cu7xxgp6+JLSPo/Zs2?=
 =?us-ascii?Q?odmrx9N033g+lsx4kk3DDQi96ltgwjr4pgnfFDAU/XeHS/UgSuHANXw240rN?=
 =?us-ascii?Q?D0HOLkI5rHQhhSltxLdd3LWiyb3h78c6GTt4AZXpqiC2RaMysinyxavNIr55?=
 =?us-ascii?Q?AxbTddfvKEebhmRzmzXgB7FhMI56uRlU/PQI0eAPLOAf7LMsZV0Os2oDrK0o?=
 =?us-ascii?Q?fU3F4PdwmLjTYs9iisNP+hdB+aBECO7Z7vEXG8sKamGYdzHjEN5qokgHzeel?=
 =?us-ascii?Q?gwkN7dgB8zVHBEWc+vvrSSGsvB8J/WVmGaB5i/gYsxK1unsz10taZMeUqyWA?=
 =?us-ascii?Q?3KEpeIoUdSSq25PIop0OZbyc3tKwLoOKNWA75zbUfIO77C0bOA+MVuBM0zeO?=
 =?us-ascii?Q?O04Q06Oi8y08iKkCGGKpXS7e2P9/45S5DQh+yC49AOGSvSIwPI6sXKxh3YrZ?=
 =?us-ascii?Q?i2xrBLc4dVkuAC2oFgoV4rTANG3sgWDZ1Y7iBKWPEX9oSrz+jVWRf9gv3HJn?=
 =?us-ascii?Q?CbhrwjpOwIkklCCqPq4q1KbJB241xJzvtdmG1vSoIP0G9Vv5aJijqAEwOfnD?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+wnvu35VH7wpmeBr+qE/YxL881VjsoKVCRYlYOvwnWV/OrevuArDP6sfSSrrtcRt4/UwTTo0ux5vkWow8hekkrVB2HN5sJ3r2cdIW+P9EQxau9m+/Kp7V+nKf9dwdAwzkJXK/WXXhGISrJcPgyAIz1iwY2+Zp1BNGO7UC2zUA8NEM3HTXYBCm+6E3RSduNBb6nGYQaMhcMZ5PZHK5n+W1jyAeMUd0brlRDyIfiYZl9HjMNCJL0SMT2AoXKPs8mkwNfL7tYs9tacS8DOIgbsNjcZshQ+w09HJrPIyb+Lp1IsWFEmI8ktame7VPYCQsyZPfMne2I5GZT223BypXuvmhLUSBVntyrk+XHUuzDYP/rD2gXGFxGs3MXL+fo5AjCFjjTiZLU4JqEbF73ma4w8TkE5HYzTm+KxGshZihho464hEqQWr5k7qmZ0GItS33rM5/Tbk5R9lk6YgG8NYlX9GPhSFJHoQ/t48v9Zqv7g4Di+OjjBFXwrB0om9bJgAqAkVgUWB7uz45qmwYyO1ndZcRtU6teLuzmxgLNBJwHd6/dgVMhFDvns1LGVVtqy2qZxTNsWk5De96JGqPT0kYvGcFgqGxVgMe2Bhg0lDi4PiwA8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb2b21c-5eca-4537-76a7-08ddc4570acb
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5029.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 10:53:48.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HbyleCpudeMRGDPziSapAWdzEWg2Oxlj8wJGgciLE4hqWlkHNR1TkzMVmSocXY3qeajyy2K8yqHbwVhl2nEpUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4442
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=832 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160098
X-Proofpoint-ORIG-GUID: Ejy6YRm9SXARzUkzWoSR2QNeuQnNeGe_
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=687784c0 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=vdaGAphgxuAu4logy-kA:9 cc=ntf awl=host:13600
X-Proofpoint-GUID: Ejy6YRm9SXARzUkzWoSR2QNeuQnNeGe_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA5NyBTYWx0ZWRfX6GnrE1HTXXB+ f5gMHvjX3xtkAQI4BUf08umLDbycXpRpe2YmO6jNN/Ac7vFB7jJY0TJl1q9kYfhj3uysfn3lMAn 79WXSbj2jjUDnpJ7TrNo0Y8tb7CP7pDAuLvxbKBMPwrlGsffu0CVzTnK5nUq/+4PAWnmNW58y6V
 yZan6WszFKQd2M4Cn7I7c7l0hs5cXmZwQDZ7gTDFsnmEJ15wkuMRWn8CX/2G45bt6OxiiDSmLa1 EQtEMJ+j4gSsIbRoNSwV96p0TBauerzpuny+j4U5AVw/ugz27LsIF/+SLxJgqWo/20aJ8N49QIC owALl0sWj1rV/dd4htoU27gQ9kBTFLF3NNgT+OSUrQOOCwENblamPmiqhEltmurIA3ivP/WwrYS
 K6kc+XpqVFumNJu2e7eSPIA1gvmuBmYRXsc2HzP1zdLauyUrhqC0zbez4o7MNb8wx+dvW2e2

On 15 Jul 2025, Kris Van Hees outgrape:

> On Tue, Jul 15, 2025 at 11:35:23AM +0100, Nick Alcock wrote:
>> > +	/*
>> > +	 * Ensure the clause is valid for the probe.  Call the reject_clause()
>> > +	 * hook if defined, otherwise apply default checks.  Rejection of the
>> > +	 * clause must be reported as a compilation error.
>> > +	 */
>> > +	if (prp->prov->impl->reject_clause != NULL)
>> > +		prp->prov->impl->reject_clause(prp, sdp->dtsd_clauseflags);
>> 
>> This change applies default checks *and* the reject_clause() checks, if
>> any, not one or the other.
>
> Well, actually, the comment needs updating because with this patch there is
> no default yet.

Yeah, you might as well fix what confused me :)

-- 
NULL && (void)
