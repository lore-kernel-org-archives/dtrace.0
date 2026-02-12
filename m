Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DA419DF4D
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770922314; cv=fail; b=m6DMO5tLfqJO3/ktgAOMhx5ji2xpGbKwB76whOQMrzv8LHOPB/iZxlek3wFC81+aOE4v9+CijgxX9Uf1qf+v3pyTc4tkdgy81qiNveg6oaW/Nuh0IeOjZ47L5TiveRyva/7dSLvT7QukEtYLMB0+w12yK0xJ/XuvrNtzD90ENDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770922314; c=relaxed/simple;
	bh=fyapVuXGEPBQ0JZIGPPmzipBQ0bqbJNtYd6YTWKZsGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=C/MX7PTzAFRl/2hV09vcqEss1uH9sninRhc07Kn9tur7aeXFOHNH3aXJRRSQCQ6uI09Jy8eovPrA0nAtcaLf7vSnQ0qN0uYDoSKEKvetNbdnOsJd11FUjFOkcgt/u47jh2ic4cga/DMsClJ8olKCWFrjLIU/8QjlJM7CppsrCi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fmtuz/p+; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I6UzOTpC reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fmtuz/p+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I6UzOTpC"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CGNEZc839220
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=h4DypfAUFfw0V8lg+lX1RNtw082zq8UbDp+PuaLAkGM=; b=
	Fmtuz/p+abZSwP4BgbmVTTce91Cnxcx4oNFF6DZr/KOJo0eIfAmmECGTYoqfhxwi
	9H5rJNCNm/IDiL82BKrjJCXPxkoM3558CSZVZhkwYK8PSUmwe8FrccimNGpMGcee
	d/ZwBsIwOipsWIlTeoI0yonGKJFDBz29hDvDPzkNF5dqVxEfmkbAA9i8vd+kC68t
	GukWy1W+DcnwVO5OEnxLAg/RksElyTPGvv+ISDFmFuLfcLZbtaPNrrGJ3jC3ZLOn
	fIS6lBKrH7i+OdqMFPgeIbfBo1XCtFojOWNczguVtJc1OPQGF+15DkFWz1ryUocM
	y2AzM/huKvmSVE49Jm1inw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7s7rwbxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:51:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61CIZIeE030105
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:51:50 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c822bah2t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Feb 2026 18:51:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNR2geVHiutZ620F3MBsdHW7gfl680X4EmExYUR2etWGsolsTCLshhnZC0dcb0FVJrzGRBntPIakKRWAXfBKQiIPm1sT9q1/IN2Jna9AxfPEYcfigRJHNBOAg0sszjCXVp/uLIFbmtJDqH22tDlFobauL9UzYnvS6SAsf/zM+g61CZkahNTMdhMA6WjCYL51m6HBjuRCIX3glG3qR0I2gYR/axiFHkKIvx46xh/4SLTC0e8xzoFkUuFI69ANCN/l9t/sFepQU3Fj8lzqJn6Mld8fK72IKsHXzQd87xT/U3snm6pq+7CctUtqZagjLEF3K2G6TeEA+Q6sOGxQsHilUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1jTKzinKmINDYi9qtBDFQZJ9JSFNiCRTSkd+cHmSIo=;
 b=kkdNOxOqRmdzuRh+PugKX5i40KYzMiQwLao2ITWHyj/nmTrKEVrPjOxqNszKWxlZbQRtUcaH7DyutcMpy8mzHaU9aHu5FiO7Owqt1Jbtc7Vru/pBshh6K5B10LdGMRk8gcWvPat/zt68D0gRVtLhOAfyt5UriIlkl+rt7k3aVezKfxOstPMTuhLONRerVDNMNGS7zoscTr9fGr+uJXARudJyEuTxQf9pV8gpnXOnqyw7J9PpbK7MZBP8x8gwuxyamE+jBgugodC8oYB1yN8jgNP9i3cFfiXGb77/kFOJaJs6JO/tU57CKAZC2YN1NX287+3qK5ytIGVIGBWq9HZOvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1jTKzinKmINDYi9qtBDFQZJ9JSFNiCRTSkd+cHmSIo=;
 b=I6UzOTpCIQTuZh1JfclJTTp18NqJ/M2joNgfji8RPibINhyMllLiNLWwcY5gWegnUMOc2qJRezwlxBV45rSSaNYRxU+Mf7rX0p+bKqyWR0UD0qjc2im2u0bOgSEhzL4ovvCUvE3QAipJrnuZkdDk/hBB7l902ip31nnMJc4BqT4=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BN0PR10MB4983.namprd10.prod.outlook.com (2603:10b6:408:121::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 12 Feb
 2026 18:51:48 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 18:51:47 +0000
Date: Thu, 12 Feb 2026 13:51:45 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2] dtprobed: use /proc/$pid/map_files,
 not the filename of the mapping
Message-ID: <aY4hQajn7use525y@oracle.com>
References: <20251202230453.124306-1-nick.alcock@oracle.com>
 <20260120162051.183028-1-nick.alcock@oracle.com>
 <08f076e7-9573-7ca7-f89a-a3fd33bf683c@oracle.com>
 <489a5755-af8e-6eff-48a6-9fbeb8c9b4cd@oracle.com>
 <878qcxomfi.fsf@esperi.org.uk>
 <aY4buJOhWlmm9CvW@oracle.com>
 <aY4d0ttnWiIzwfWu@oracle.com>
 <aY4fWtW6pHgFUkEL@oracle.com>
 <cac20746-0207-711f-ada1-c96b1cc6603e@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cac20746-0207-711f-ada1-c96b1cc6603e@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BN0PR10MB4983:EE_
X-MS-Office365-Filtering-Correlation-Id: b9d82d0c-d800-43d4-e78e-08de6a67c67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?BK1KPFuDok1WpxGD00MQw0soH0oSI7Ps8nQx/01Mujg2y30caIudCIMpUT?=
 =?iso-8859-1?Q?gWDdIugJLnTqhXjUZDxB15F5WDD6hTfhMli67IJ8E+rofF0xc4g4pBlzQ6?=
 =?iso-8859-1?Q?IPdhsXH/mBDJ5tC5gjL3QRQw41H+/RNUtW9ixmG7fwfABeINkjXVJArj1w?=
 =?iso-8859-1?Q?eHehO7+fhee052eeZJYIJhXzDwOXCb5uq7+sii+zU2W+pkUuQ6slzSU3R5?=
 =?iso-8859-1?Q?c/9Ds4ZpV/cdKfl1jhgZGDGhUkLTQaZVcF0YgwYk2Sd5n1Qz0wSyJiqJl7?=
 =?iso-8859-1?Q?pwH3qqO6mms9PX0hLiyO9WXlS+Kts1EKxevYkW8X1+9s638opb8qszzR4j?=
 =?iso-8859-1?Q?5bLPB/oEhQmRgJshwrdCECocYa1oTlm2wkgmzvpbyrBZMgbgHoHNisBPuQ?=
 =?iso-8859-1?Q?yuHTBerq+yj1K/ghthOAOBWdrorAELwM5Jl55YAlAbgKCLS3QfyizDh+yP?=
 =?iso-8859-1?Q?i9/1Ykr+COSq+YPsJJoBFxUZwgTf0vnajrWZdna0qSczMsnVCq8gLDIGNN?=
 =?iso-8859-1?Q?mdmTcX+FyTMhEMu69UI38c/h2WpuSxz+cSWbSYOKocK5MGryMQVx3uY3jw?=
 =?iso-8859-1?Q?+K82CW7W4UPzW99gO1QPGevw4SwaUr9gGKUxnqvGsBoTwfnmj9FzhwtnNW?=
 =?iso-8859-1?Q?yXqmRtLv332tIoPIqkYvVBepKabg5p1k+JVt9RUMBbDDx9psbLuxHwFzWH?=
 =?iso-8859-1?Q?ORIjrm5PYgn1FO5HAdv9s8yZ+uTF4LZo+gEBuOnvFn1yNMgBk2g7FtsK8z?=
 =?iso-8859-1?Q?y4zamGuLdI4rfDAQsm0cfJylL8fOz8iYU8ePt2AFMwvwywmKZjyiDFnOBR?=
 =?iso-8859-1?Q?c9u4H2UO23/vubDG4Y7oQnlfNhVIU7C3v/6TTc44fMZI2BUMquQQf0jB2s?=
 =?iso-8859-1?Q?1FAhxL5k3JZpIppjSMtv1QOPu5ICJkpv0QOY8ZwWYazukJtTlh54LHCO/H?=
 =?iso-8859-1?Q?5r6zhMbrZVBFyDUqzrEZbjfroeamCKSxQKtPWD2+tUpkMLqcW1WJtz7T3E?=
 =?iso-8859-1?Q?zAf335aieMn4TM6xNWJaxwJcjN6mKMzbuHOfQlrSuiJp/bcHvNsCQvVrSB?=
 =?iso-8859-1?Q?bchhgutWta1XcgeJlAJ4BOGumZWFLkvpQABTjF5ltvMVbWjSFqT/YZI7qR?=
 =?iso-8859-1?Q?6km9DrcGJWI+TiWfnJUcy/pIoc/VyUfsXWTdAsvaQRiGv83s7VlQyPGmWh?=
 =?iso-8859-1?Q?6Fanz5D93BGE42fyvRR5J6IrrsG8oIySyZAIvy8EniA9c5jCVhhz3t60kP?=
 =?iso-8859-1?Q?DKGyWCpg9xL7yklbq0rhUQ0p4MTj2tR9iYIYTkxlrzRhzwbb04gRRXEwr5?=
 =?iso-8859-1?Q?yi6SvrrcyU7pv4VLed/urD3HvfLlrrnfxZi2E4qJ647K+OT0i2eZtvbTqz?=
 =?iso-8859-1?Q?AWecMaBGmGrwGwuvp+5j+djccQiJkO5jb9VgnSqU9w/RlFAnD8Zst5ce6q?=
 =?iso-8859-1?Q?xw0fZ2gSOpojF8Mf8dniIp8L9tGlqMwZHQKKky4f7Vbv5e9UYvTACEVyln?=
 =?iso-8859-1?Q?L3meLgF/4hYSy94aqMGH2V7yZ8OAgaxPJ2Q0+aXoKpcFrQMDiDzOFVobiW?=
 =?iso-8859-1?Q?fo3GJ6BAPQ699dh2pAeChArdQGpY5sV8lHswvNy8MP41k47hVDz/RzfEGP?=
 =?iso-8859-1?Q?xmUydne0U/6NI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?UpXZBMKP+SnSFmoe3GnGiBdAB4lZvEajf2gFQnDLiIBIug14f6FWywMBFE?=
 =?iso-8859-1?Q?NOh37gbnVbjO3d4kEsz79xrTPJ8GIZQneihBU3zQBt6qHLQ5NHLhiHqXNQ?=
 =?iso-8859-1?Q?Lw5RZBb2CvmvRK9XlA8RClfzrx/9zWZIOwFl9ihjLu13KZId8Vj8lxVWW9?=
 =?iso-8859-1?Q?GcNOGBmOM537P8IjhZEnsK5za+FjEyQdRAhtSke8ZXuLJdOs934biZdUP5?=
 =?iso-8859-1?Q?z75nepBuzg20kwxSPT8EjDYJvLZZ0dvs8V6eLPxDf8Iz9NJBej0VADvaAn?=
 =?iso-8859-1?Q?8IRAzsASVojRgaf2BDdlaW36VojymfEcgByeT9RDNcthqVaZENUkwRvc9O?=
 =?iso-8859-1?Q?Dqq8u6R2jsMlCZkhRImbGUI5GXAo77WzZdSf4nnp3X6cIUqs+TXSXsVNSF?=
 =?iso-8859-1?Q?/qvC1bXEo/wnIJyS+voKMTt4e7n7PwSg6BKK+QIf6H2X9471OrWVylMGt4?=
 =?iso-8859-1?Q?nMP7OsCpwAtqAiJ9C6hs/jqqN6ddRwpZHmxnbjvmC6iGjQxrB+2fTMzeuW?=
 =?iso-8859-1?Q?1bRS3NqqarDbSMxaNzFT1tRLUs8Iyn5KJ+DcBlektqJCPFt5w+HzXmhbEA?=
 =?iso-8859-1?Q?4hykAqmd89E7U6i8B7Xran9VQhVETweUIcIaAKXj2sFcj9rXyJdEkoL/RA?=
 =?iso-8859-1?Q?lHNCMkvlhy+Vl9D5uhoE2t/u6sTjQCOlCUQ/Oc72NhKL5hH6Z5H/v8zgAQ?=
 =?iso-8859-1?Q?3xvFXfyXbefwPzuiI51pHQyXzlibdLJRdMoTkVVsJ91YSUgYZ1nXh5c6sn?=
 =?iso-8859-1?Q?GnBxucbL4Jip242XFr78C2FZS2+qSSYG5QPhpBABzyyoRujoIufSzVCjzw?=
 =?iso-8859-1?Q?PTQcaAwoCeu1JXntmaupioRC3x5vPFWZU3i01dsjwSYtm4HCVVQvZwR2oI?=
 =?iso-8859-1?Q?1Nfw1n/d+eD9mVeHDTN9BNakKikzIThGdUDB3UAUszdhobKUzu8H9H/yws?=
 =?iso-8859-1?Q?1qMDQilZYKAweTuyWnAHRAxIMFQG7hqCW97I25coIapmrtU6G7j1wu2qtx?=
 =?iso-8859-1?Q?VBflG/TP6Nuuei7QtihhCbIgqiojDaokwVUm3cvO4fcyYNFHrRTQDWza6M?=
 =?iso-8859-1?Q?EpCztL42gZzTVZOQBs3dJTmoDYHJbRQJFxLjgGTtgRJvJ+JvYzCnaBMkcl?=
 =?iso-8859-1?Q?TTz3oBjfcl3GzkHVc/zS1xjRg4fYhvU2kNcAzXqhwkbRNcKIXjVvA5turx?=
 =?iso-8859-1?Q?04W1+nUlv8aSUJb5C69dN2/sOL8yft+N0UrFY7DphHmkVqDAUJPG4HOnl0?=
 =?iso-8859-1?Q?+NXlpFnpsU8cywYpRwq+WiEwdMIUJIfFh1DnrhQqNjY93MlTOTjbv3QfZq?=
 =?iso-8859-1?Q?dxQyyiRvZlwV7wydKCWR3GDC+q6NDwohf7DfVDc+BMVwe6KMsDZN84jZlF?=
 =?iso-8859-1?Q?IjwVjQ5CRpjv7A4IF0grEu1gVQYiTUle5Ae4DeqjeL4uioOTQIylJx62pZ?=
 =?iso-8859-1?Q?QHZyiVRrexJvNmH4+ThczQHpn5CMlQH5m0ZruFYyzEWbsD1Q+AvQEmjwv9?=
 =?iso-8859-1?Q?NKaMeCGdKEJk2HHpa/X9uznJ/W9n4kMfVwxAX6r0dUiJS4m2Yu+VK8oXpl?=
 =?iso-8859-1?Q?zApkDT7KeksWuRLrWxlg/t2JiwO/I56019KRud1zjJtJvIZka69SYpTKkm?=
 =?iso-8859-1?Q?fhZ4DZR6Dce0i6dCY94qtfz/YIN/mMrXRX2H0kayEmkItJqD5/bgatYux8?=
 =?iso-8859-1?Q?BTwiiLSImT29HmtAm6ygjOfimgHjXkTG5y5vbjtZTEWcpakGaFZYI8m3Cw?=
 =?iso-8859-1?Q?c3rVLQGbAvwnN7WBVLJfdxlvQH0sNfsrWBixxs3S0AP158PvbYIYKsmVBA?=
 =?iso-8859-1?Q?P3F9Q3LVDQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OQgE42VXWgG64y7oezDvtjmhNuIolTr7OOzOS7++kx2KC7wnxjjWqE0YDJ84/3hkikR60zCxv9+fHFzZQqY/MVDSYZahwyzeQ1ZGxmtJ+m59t+53k1SzxLuNTiE1jAOeatr5shFBBLgJckuqMAdmjHRO7ihMkUxxNFG8+Fk13tOwWHo9a6bQDoy95b0FXOI8kv/BuqzgT38HoR//21a4nVDjGiRrUlTL0bAHXp85tAdQrLQXshtkKBdtTHLs9HKNwvRzmHRZoG31hrHBwz+SIH3D1U3fGGlVLmT/5ArJIyyHGd7CEDKbGoiFK1mVU7xuN92bmm5BVSrFb6d5afDtenqOpcHd4kQ3EKXV3W/foheGAIYg0SEUYvG8h8gO4fD/qYX/3JOdjaqZlyh5UcVQlDf9lOuePsfKvMB48fZxJv9HLItoVAZdFf/c9Z6q3y+OJIHRSsmEbrCvYC2XD3AptAPjwgmQYsWithbx3F4GqehIAHSC0sqnKNlsNgu/qdpprNU1XbtWn0kWb0JHASkbADnYc8ZQ5IUBZFNleJsnDYuZTSlR4Y6bk3EraUvtOr1x8EUB19z7KKPfG22DjAsndm4P+kTflP5dV9UhI7ckZmE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9d82d0c-d800-43d4-e78e-08de6a67c67b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:51:47.8750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHJk5Nm/Rdofi12Ck5MNKjGlg8l7k3tFy/GJnfqjMDW1JOT10twONdRZZfgH2MJaN91LFmdaLoMlZlXf4IgI3XzGl/dkXwp3IlkiWg/T/BA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4983
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602120145
X-Authority-Analysis: v=2.4 cv=PZbyRyhd c=1 sm=1 tr=0 ts=698e2148 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=64n8z8otlp8bWrbHBXkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0NiBTYWx0ZWRfX73LSFb1jWKjg
 cCSmblLYQ/jIXFtYqMTfi/YS4cg977SGT+1bB+iVk2jJKKpv4tH3zJevimV9LgOcOvXf16OnvkO
 /NXfLVrffvhueCEeaSiCguRhkyiOF4jBipmnhG792D44HKDgK4jkrsmT+b/5MeAVrJKbtvAiQ/9
 5onLlwPKKJ0GgVNJUb8HtVsV9IHMvCr2AmnLainpz+7p7IaIn7/NinbgOJL69Rqw1RfLUOTkaRc
 xFYqDOTFAk473KFu6J/opism+DdEFSQw040pPdTlixbMs+3DK8vBABSXzcrfQ6oT3j8Kwvg4fuX
 F4PMjnngNWRXdRMs96LCuW0UNKqGnxRKbAxncq6jymM5KVtUCN8UhbcIzUM/tXvmPSqHKMtjtK+
 RUjuohAVC+lQNwNBQNaKzRtrLOGLVN00dxC4smanYwc/tZEpNHc96FbhILRP2pBIXLlOp5uFl+O
 CaL5dSMSOdrGSl/bomA==
X-Proofpoint-ORIG-GUID: psWbRb0vPKFvk362rncPBtrMlfOyqwSN
X-Proofpoint-GUID: psWbRb0vPKFvk362rncPBtrMlfOyqwSN

On Thu, Feb 12, 2026 at 01:49:54PM -0500, Eugene Loh wrote:
> On 2/12/26 13:43, Kris Van Hees wrote:
> 
> > I believe the following on top of the original patch should resolve this:
> > 
> > diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> > index 9a692805..34349deb 100644
> > --- a/dtprobed/dtprobed.c
> > +++ b/dtprobed/dtprobed.c
> > @@ -487,16 +487,17 @@ handle_usdt_notes(pid_t pid, uintptr_t addr)
> >   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
> >   			 pid);
> >   		goto out;
> > -	} else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
> > +	} else if (prf->prf_mapname == NULL ||
> > +		   (fn = Pmap_mapfile_name(P, mapp)) == NULL) {
> >   		fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
> >   			 pid);
> >   		goto out;
> >   	}
> > -	mod = strrchr(fn, '/');
> > +	mod = strrchr(prf->prf_mapname, '/');
> >   	if (mod)
> >   		mod++;
> >   	else
> > -		mod = fn;
> 
> Is that a '-' on the last line?

Yes, but it is missing the last line (sorry about that):

+		mod = prf->prf_mapname;

> > On Thu, Feb 12, 2026 at 01:37:06PM -0500, Kris Van Hees wrote:
> > > Oh, easy solution.... determine the mod name from prf->prf_mapname like we
> > > did before.  I.e. work with two filenames, one from prf->prf_mapname to get
> > > the module name, and one from Pmap_mapfile_name() to access the mapping data.
> > > 
> > > On Thu, Feb 12, 2026 at 01:28:08PM -0500, Kris Van Hees via DTrace-devel wrote:
> > > > Here is the problem:
> > > > 
> > > >          prf = mapp->pr_file;
> > > >          if (prf == NULL || (mapp = prf->first_segment) == NULL) {
> > > >                  fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapping (process dead?)\n",
> > > >                           pid);
> > > >                  goto out;
> > > >          } else if ((fn = Pmap_mapfile_name(P, mapp)) == NULL) {
> > > >                  fuse_log(FUSE_LOG_ERR, "%i: dtprobed: cannot look up mapname (process dead?)\n",
> > > >                           pid);
> > > >                  goto out;
> > > >          }
> > > >          mod = strrchr(fn, '/');
> > > >          if (mod)
> > > >                  mod++;
> > > >          else
> > > >                  mod = fn;
> > > > 
> > > > Since you changed this to get the mapping filename in map_files, you get a
> > > > name that has the address range as its filename, and since that gets used as
> > > > the module name, you end up with the wrong module name in the probe spec.
> > > > 
> > > > It needs to be the actual filename of the source file that the mapping came
> > > > from.
> > > > 
> > > > On Thu, Feb 12, 2026 at 06:18:25PM +0000, Nick Alcock wrote:
> > > > > On 12 Feb 2026, Eugene Loh outgrape:
> > > > > 
> > > > > > I do not know what went wrong here.  I would have bet big money that I
> > > > > > tested this, but here is what I find now with this patch:
> > > > > So did I!
> > > > > 
> > > > > > test/unittest/usdt/tst.enabled.sh: Running timeout --signal=TERM 41 test/unittest/usdt/tst.enabled.sh /home/.../build/dtrace
> > > > > > FAIL: expected results differ.
> > > > > > 400000-401000:main:go
> > > > > > 
> > > > > > Diff against expected:
> > > > > > --- test/unittest/usdt/tst.enabled.r    2026-02-12 05:31:24.000000000 +0000
> > > > > > +++ /tmp/runtest.6196/test.out  2026-02-12 18:09:58.980466976 +0000
> > > > > > @@ -1,2 +1,2 @@
> > > > > > -test:main:go
> > > > > > +400000-401000:main:go
> > > > > This suggests that symbol lookup is failing, which it shouldn't be,
> > > > > because that *too* uses /proc/$pid/map_files, or should.
> > > > > 
> > > > > I clearly need to debug this. Got a system on which it goes wrong?
> > > > _______________________________________________
> > > > DTrace-devel mailing list
> > > > DTrace-devel@oss.oracle.com
> > > > https://oss.oracle.com/mailman/listinfo/dtrace-devel
