Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC3194A40
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689241; cv=fail; b=YhsAI34C1SgwI51Q0lml2cDz9o6vcfhSX3HHRCIK4cZf3UNMStpjvoAmTJeEKMDmAvxFZBUo78gav/on/jdhB4RKJUV7V0WqKw7itTvA2dcYYCJ1FFXGUTiU8tcHON6rd1CfWfsy6NdRAJr/bR+5GJ0Kq0lK3ayTmqWyXSmTnaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689241; c=relaxed/simple;
	bh=eoVCAmCHim1V2n+bHRlGMcAv0EaD9YnaIrqohChSiXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aqG4jq+HeU1Lp6b+p/+KnFeuKH0ZdxgO8b/AnZZ88ZhZ/udc0FopCwhddxHEOpXlT2m35nuNtYu55X7a73e4bS2H+WGQkyrkxRqYczsQqFBSoOzkdfkJ5DgcNDI++8DaUbKfIM+q7fBokmGs2cl+6U9PyVUWNzuBk8/LLk34F2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P+WbOnsV; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wjg7CoHM reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P+WbOnsV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wjg7CoHM"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47QEfX5F028280
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 16:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=on2AkFWZ8GHP6vRfXTGBdqURb4Q6EtbmCMjW9PVxA+o=; b=
	P+WbOnsVp5Xl1sg9N8+I+j3OFHF4Q5vGmcuvPnRaDYHRyn9MInycYDwbIWFejrIE
	n4Bnulixv+DvH1+FMdBygz9GzhowJYcRnTbYU5P/Cbq3LA9ayeFeEatebvUgeNMN
	F4ynm3iMifp6thmaji8eZy2A1wIfGHZbkNYRSj3golBC8FqqjEdiHhrFtd0S1IOx
	PS6oO/0JNpvqt2HTes6Ngh/xZwXuBvxxGusxfPbc57o6kz9fnJY8JoogOLmV1lOL
	tWKMyGfQ1kSNYVD7HhDyKba/brvxMxySkR+pt9I87BMPLMCGSFr50+LikL1eocVD
	jsXuyJRcZ/1kSt2/9uAZwg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177nw3gjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 16:20:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47QErZAr032135
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 16:20:36 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0sqw1x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Aug 2024 16:20:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nV7MfjIZjXrGqcVcreH5wkyaSjYbHS+AeXNwOuFC3hw//OQ5LocRrkDtnJJPdnyCQKya5ZBypCFmS63oN0cXdvoTB3KtuBSRlGNb56w+Pa7R/dG2OFpSnpBVlF/RHP7HhmwdLeqSc8phv17lL52g3kyuoj4BqJ+rotJ+GAPfkeUgAjwroA+1q6pCnWaI6k2TRx9GCvOEnkaurtwHOGr+JQqrnxxvGyhlo0RBqFkUYb+sZfzD1U4yvAfYDNsbhBM9UxyjRUVRO/tzvWTxMbM72Ne6y+LfAKNr68PQNxgqu415K1Py5VFljj9UnAAdywz+eflbT2Yjf3mAS4I4ot5ntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArXaKhoL8eno2Z6CI595LF3f/xQZ4nuY8JLSJPTnY8I=;
 b=m5z6lqwaIdDU8L62gnM+ey8lte23ibyxH/YwFqrXPBDbotpwVvcKdZh73bog4e01LF9HPbSRzzD6ERCXP67aowKHflq85diEUSvrKedndv6vcxJv6zt1Ja8q03Zj9bb0kOmivhvpLX2Och0y6UpBbmPMqSXx4EktOtsySlaST1yBMbZXdmWAeOF1oJDWUqW5IeLPL7I6SB4JW3pnVEiEknZu/pAq088DITiI3NXLx9yFFPU9uzG9PlDeVMFZx3qMc7aefG8KpFkiX07dzCQLOWs4jgAUW4JsiXfCfXx4O2wwuLVoNYrAWFNvQNzcBRZSrBBBMdSNd87g2wuRtwsSOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArXaKhoL8eno2Z6CI595LF3f/xQZ4nuY8JLSJPTnY8I=;
 b=wjg7CoHMgWtmFUoxM4BwUmG9RyU52VRnwXONbINmUkVrnx6e7xr2WN8h7r171tXEKDO33PPh9cne1IpkcTcMZK78Zadp2FEWiputA5JeDDYITlE0QvlIilnw9EUgOsEHNBXvyywViUwDdMau2aT2btXC+Ui4gdYKOpYjNuNpoSc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB5820.namprd10.prod.outlook.com (2603:10b6:510:146::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Mon, 26 Aug
 2024 16:20:33 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Mon, 26 Aug 2024
 16:20:33 +0000
Date: Mon, 26 Aug 2024 12:20:29 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 31/38] Fix dt_pebs_init() call
Message-ID: <ZsyrTYUHihmORaU5@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com>
 <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
X-ClientProxiedBy: LO4P265CA0040.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB5820:EE_
X-MS-Office365-Filtering-Correlation-Id: 8886c97e-931a-4b7a-3c72-08dcc5eb0294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?LXlaUGvnxzJ2GQjluul7k33rQtWjprfFmn/iukRbvKvNqJ9rzaiBpVS8VY?=
 =?iso-8859-1?Q?bSv0T8trWI8ZqKVkZvz+WKx/wn0YQITpfXzHtTDbe1sLEGbHTO6kxxfS7j?=
 =?iso-8859-1?Q?XhYZjWG+5PZRtpTIDKtIaJ14EVQPX2NMY56dkT3sdSRl9Z5DneLropTvhX?=
 =?iso-8859-1?Q?KD6Tg1+k5sf2YMiLW9luSlD1OpGDA+XPjFuq9L8e7JD5JZAXUlkI9CODTF?=
 =?iso-8859-1?Q?4DBHqzv0RPM5Iq8mfcXLGOOsunjDxDQI52p/Y/VaGEStCVbIfCW1cuM8n5?=
 =?iso-8859-1?Q?C597NImtuMGgZFi2wwDLIXY9CsxkwNadswM4ORcKBDM34vgwlp9pBD6GJ7?=
 =?iso-8859-1?Q?LtofY/McRELM2bUTI1rpna3Rp1iKeOHGzdSDpEl8ZYpvFnhlUBYtFeaatG?=
 =?iso-8859-1?Q?QYmnUUqlCoT4r6qCKjz/qSZdop/3LbT9uYl80VLdcDgiiyR/5GN3mCNyrF?=
 =?iso-8859-1?Q?gfrVefToamz7aFflH7mSFg1DmaOyuvfm4fIl8BEUZ5O6QKQz3cN8ZFdULF?=
 =?iso-8859-1?Q?9JfyWmJ+52u/H4SwEvFV5bwwu1QA58w6rmXqAcdWaS7UCgSKW+pPfuibuQ?=
 =?iso-8859-1?Q?C03UZPVQT6pnABLTiGIhZuUZ6Wx6cDWzo+LXzmQdtsz0lS+WHo2ISCMQfc?=
 =?iso-8859-1?Q?ostSEGZFuNkWpDo/QZb0ZQWbZnXcsboE6WUMNr9xPf+6JglEGa9amZbo8g?=
 =?iso-8859-1?Q?O905R75BmGh91wALdl9O9/afWz+ShGNU57JJyujrS6VW/CGMD+UztNmoE5?=
 =?iso-8859-1?Q?zY06rEm8pqTKBC2zNg9sT4TyAOkqsycibphylzXr0sSfJ1l8J+bCFAtt3I?=
 =?iso-8859-1?Q?4TvxOOLPgIUronsrYMdabKgZZXw8HtVILEk0NW1dywM+6huXa63xahDm/E?=
 =?iso-8859-1?Q?8bkCd4jpkniXJbj3m+LRsb3pkWgQ4WYD+CccqV04FjISa6Kapg3TCf9v1M?=
 =?iso-8859-1?Q?dbulVl0B/VUZpt/B78RgcpY/n+bSPKWJ4QAu3MB8ZAAAQdlqeUlNKO3EMP?=
 =?iso-8859-1?Q?BEFV3nnMPlwDOo58oyRO/5hroadgSoBpDRu+wwMqJtEq9AvZf39xPuKqlH?=
 =?iso-8859-1?Q?J2K+L0J0UZKR2zY8TDx62WP03anV7y3u61q9TXbiS89ZEjci8Eay0Lo4GC?=
 =?iso-8859-1?Q?5XKsBFfjmuzZE7FNflLO3/loiovK2/HrTGAS/MF9eNZI2WyiSA0iOhn35w?=
 =?iso-8859-1?Q?o3u4avTHL+n92b62Ukaji/enoNhIPbee15FKW6uqz91ZBik4IElHx003aa?=
 =?iso-8859-1?Q?zYIUl9XyOFOfdUTfX/qOSm1ZwGfqOcpm5eVpUq3+xq3Glg0pU6dsk2my2R?=
 =?iso-8859-1?Q?V5PekfSE6lKEPrcviM6NlMiqzT0jKhkjGfX02ukWjemF+IQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DFI8KRwIqr6MZRUYibTd9Hsy6Zer+TQZqIorqE/tuUQX2dkLdWdowcohu8?=
 =?iso-8859-1?Q?A3UBfAPuROHuXjpMt1b4KmjYwMpCkDrBd+95ZQf8IBdU/L19kYJwQZu1fy?=
 =?iso-8859-1?Q?Nu/fVHcU9vhZIQZ12iQpDfbCwiej0gwmsLOQ8Lf/mG/ZNEkSDpg4Ee95zs?=
 =?iso-8859-1?Q?mXxg0vTEwyFRVps51vUMa97LU1r9ow1Cz5XLNTO88kPuwJdB6kaqHiIopl?=
 =?iso-8859-1?Q?R4x27v9HNLUCFGIeBxYh8rYc7s44c8Zv+mPm4mF9fMBYGe/LA7BC5JLMK5?=
 =?iso-8859-1?Q?4ch1cTuzvA7zNV/LsjUX/23w5T6b3WkeGQBbA2KL2qu9PtwiQhdbHp0naC?=
 =?iso-8859-1?Q?H8pP77h5zqy173c5vxF6BpIuPncjzhctsZydRcZAeExBUF0PsduBtOJk3R?=
 =?iso-8859-1?Q?IDuUKbyYcg3q8iBourqAVWcmqNvppCjafIBNnZRqb8+5QXx9AleRsSEvDq?=
 =?iso-8859-1?Q?St4/ugBsiCG1li1klvyBI6/qgImlceaG+XTcFtkATPKX4U+ZVVbzPLcgot?=
 =?iso-8859-1?Q?LtqPsMB8OE7Op+nZAQCJzzKLb9uXgsfRlwbzqmjH9pkWCKhqLHSk7s0jcA?=
 =?iso-8859-1?Q?jYk+TeRSndVdoSdvKh1VoxOV1ZHT3yn+vA+ukmKRpyxx8LLLVg/PVXHe5B?=
 =?iso-8859-1?Q?38jvWApIUE5b/G67kuWp6h24rE+Dba+lxT6TvTtvajOAsydOVagUEyxWzQ?=
 =?iso-8859-1?Q?JsW3pPBmmZj3px5T7IhZ48usQ63wDuPRb/pDl6u+Xwm6tOk3tO5XKjTU4y?=
 =?iso-8859-1?Q?h92sWS5VRa3KePejp4oZ717lLyKkuJwh+f1YsGs14FwKH4A8O71ho8fDxD?=
 =?iso-8859-1?Q?LJCBUwIZ7VkdOVhWuRWac9+OZ9UKj0dvrraynCBNCmG1Kq5fckeWZIrL57?=
 =?iso-8859-1?Q?IkTV+QGgsQGCMiU3aSiKfpZqqMtWyZByVzEvSVdG7X6/GdwDuMdHcZjlb0?=
 =?iso-8859-1?Q?OyAUiXqTp3kTv47ciQ0EaBUrfcyYx+YQnUtskuQ6PFbQvXBw1Fgz6JhvWK?=
 =?iso-8859-1?Q?xegj2ZsRKQyvuTjldssw2s7ueJTOA2opdAmey55Qx0NEf4PhonX7v76wVY?=
 =?iso-8859-1?Q?FmTZpzIvyPDgtxTHPB3htSnELN4R2PoPAxbPrma8txUDYEN+mZ9pfltrfe?=
 =?iso-8859-1?Q?xcASml8Hmzs2g8oAl7/vON9q1s3F+4KCzNpM7mKqLvBbzZfkmmT3RP076Q?=
 =?iso-8859-1?Q?ngks2YooHYyVAC4OyEHlN4l7oDDyiB6hgQANvi9Ik7YKeSdAmnPZR7Ia3e?=
 =?iso-8859-1?Q?LHu8+6SDMYmJLl19uzVGz4FLizbLpfEkPDf6qd2pkRZfUpk6ysksz+jRqt?=
 =?iso-8859-1?Q?CHq/hRTwHZjIEjKVpzX0eV5VAxc08ueMxjF0PZqU+XJqlW2/7AsdUnPWtV?=
 =?iso-8859-1?Q?p17jLTegj1HbchAYRr+RPWjriCft0vQehpUz/kuvhUcrz07BJE6Pzew+JB?=
 =?iso-8859-1?Q?c2u3P/QTHA76eSG2NHy8Ku3WV2M9J2XpbbfuRoLwddqdSl3NfEzURyNo30?=
 =?iso-8859-1?Q?snkJ+KT+FLaXByFOwjAX2fQoryQBIcNhHIPRYJ8A4ZBSpjFzkKBrvhdVGJ?=
 =?iso-8859-1?Q?883RVsp28h1+2VnMZh2nrF/TWveAKyb3CRQ2GJ2VLbRHpU0T6QcVYh8I6l?=
 =?iso-8859-1?Q?q1P/hgaKgxoiwsski0XuCPqDz2FU4l8DTbxRmc/z/rjhL7LCR5h2Nvdg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	04Y4FFPgBuy/myxIml19v5gWHD/mRLsZyoywFAfhg6EvWkoWM4IXoUAgO+ABbxRvVgHgAUMssVWD104h2vICSLDgSZOGoa3KtQZ1NQYpIZLY8cvcLv6llF0rbSs2WXHLED/3tv+jaacNd06Ha5lUEf5YztMQ0ohqetgGpENqKJJgGtPStb9jY9PbeBauXVC8YADHjdaHhz5OHll4pwEcoa8bvL6Pd0M279IbFMKMpkG70ENqPk+KuymSk9/1SsxrdDNG2jLsTT3stUznT2gL02gWjq32g5LI+3LBLV3bcJdQ5mWK5Zgcd2pk5A1TeYM1u4lgsYEe6Z6HTzlZ8Syp3MpdZ1igxULOgUQ3jq27jWsa2g7EGreUXKMohcWNEVWKhSxahyfNZ6M70td+wvlhoBec/yzE5EJRCnBhHvevvsvamgBVlqblrvdYG7yHCP1ti7oPGUMnITWeQXlImux/3N7D3Q2jRr9rrhcoTicx9a5ilLpYRCytLZ8b3EcNSlWcfndeYkXQmHTMXl8D2mvRahcdL5M5OpSemxi9nBUNWmDDZnQHCkr6K1VlWzGcBkyDLV4Q5ae8jLaWVFiCpphQKGtAKOd4XGShsyuNBetLhwM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8886c97e-931a-4b7a-3c72-08dcc5eb0294
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:20:33.2655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRqPt1BaQBf9QkvYKVqz4TObTn48YGYbNoXkGbR0tjm91fkFFaCB1VuFXfkd5Q23o8f222EEh1yvdU14Dz765pLqr/6rxdzb5MAhjgPROfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5820
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-26_12,2024-08-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408260125
X-Proofpoint-GUID: 6YXFjQ7OAmmmn2cpV2c9DwwQXyu04E0d
X-Proofpoint-ORIG-GUID: 6YXFjQ7OAmmmn2cpV2c9DwwQXyu04E0d

On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
> On 8/26/24 10:30, Kris Van Hees wrote:
> 
> > This patch goes against the intent of the code, as far as I can see.  The
> > point of performing the size check prior to increasing the buffer size was
> > to enforce the limit on the size that was explicit set by the user.  Then,
> > if that size was sufficient, then DTrace is at liberty to increase that
> > size to a whole multiple of the page size.
> > 
> > But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
> > not enough to store a single trace record, DTrace should report an error
> > rather than increasing my bufsize setting on its own.
> 
> 
> The point is that DTrace *does* increase my bufsize setting on its own.  Why
> should DTrace complain about my setting when it's going to ignore my setting
> anyhow?  What value does the pre-existing behavior offer to DTrace users? 
> Are you saying that DTrace should not resize?  That it should honor the
> user's bufsize?  No more resizing (to page size or whatever it wants)?

The main point of this code was to retain the bevhaviour that DTrace provided,
which is that if a user explicitly requests a bufsize that is less than the
minimum required for the given trace programs, an error is reported.  That is
a mater of being consistent (even if it has no practical application that I
can see).  Tests from the existing version failed because this was not being
done right.

As far as functionality, as long as the bufsize is large enough to hold the
largest trace record, DTrace can (and needs to) ensure that the buffer size
is a whole multiple of the page size because that is required by the perf
ring buffer imlementation.

So, DTrace only increases the buffer size to the required multiple of page size
if the user supplied bufsize is at least large enough to hold the largest trace
record (or if no bufsize was explicitly specified).

We could opt to change the behaviour of the bufsize opton to always round up to
a whole multiple of page size, but that is a deviation from the original
implementation and thus is something that would need to be documented, etc...

Aside from the computation of the minimum required size needing updating when
patches (e.g. the USDT changes) modify the layout and size of the trace records,
I do not think that the existing code is wrong.

I am certainly open to a feature change to make bufsize always be rounded up as
needed, but that is not a bug fix and I think that ought to be its own patch
(along with documentation changes etc).  And it might need some more discussion
because it brings up the question why we wouldn't just simply always increase
bufsize to be the smallest multiple of the page size to accomodate the largest
trace record.

> > On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > The function had a few issues, mainly with its comments,
> > > ranging from typos to incorrect descriptions of behavior.
> > > 
> > > The function has only one caller.  The enforcement of a
> > > size minimum was problematic in a number of respects:
> > > - it was missing 4 bytes
> > > - it was enforcing the minimum before the size was
> > >      increased by the caller
> > > - it was checking dt_pebs_init()==-1,
> > >      missing errors with other negative return values
> > > 
> > > So change the function to accept a minimum and change its
> > > return values.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   libdtrace/dt_peb.c                          | 27 ++++++++++-----------
> > >   libdtrace/dt_peb.h                          |  2 +-
> > >   libdtrace/dt_work.c                         | 15 +++++++-----
> > >   test/unittest/options/err.b-too-low.d       | 22 +++++++++--------
> > >   test/unittest/options/err.bufsize-too-low.d | 22 +++++++++--------
> > >   test/unittest/options/tst.b.d               | 22 +++++++++--------
> > >   test/unittest/options/tst.bufsize.d         | 22 +++++++++--------
> > >   7 files changed, 71 insertions(+), 61 deletions(-)
> > > 
> > > diff --git a/libdtrace/dt_peb.c b/libdtrace/dt_peb.c
> > > index 5268f089..4983ba91 100644
> > > --- a/libdtrace/dt_peb.c
> > > +++ b/libdtrace/dt_peb.c
> > > @@ -136,18 +136,14 @@ dt_pebs_exit(dtrace_hdl_t *dtp)
> > >   }
> > >   /*
> > > - * Initialize the perf event buffers (one per online CPU).  Each buffer will
> > > - * the given number of pages (i.e. the total size of each buffer will be
> > > - * num_pages * getpagesize()).  The  allocated memory for each buffer is mmap'd
> > > - * so the kernel can write to it, and its representative file descriptor is
> > > - * recorded in the 'buffers' BPF map so that BPF code knows where to write
> > > - * trace data for a specific CPU.
> > > + * Initialize the perf event buffers, one per online CPU.  Each buffer will
> > > + * have num_pages * getpagesize()).  The dt_peb_open() call mmaps the allocated
> > > + * memory so the kernel can write to it.  The file descriptor is recorded in
> > > + * the 'buffers' BPF map and added to the event polling file descriptor.
> > >    *
> > > - * An event polling file descriptor is created as well, and it is configured to
> > > - * monitor all perf event buffers at once.  This file descriptor is returned
> > > - * upon success..  Failure is indicated with a -1 return value.
> > > + * The return value indicates success (0) or failure (-1).
> > >    */
> > > -int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > > +int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize, size_t bufsizemin)
> > >   {
> > >   	int		i;
> > >   	int		mapfd;
> > > @@ -166,12 +162,15 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > >   		fprintf(stderr, "bufsize increased to %lu\n",
> > >   			num_pages * getpagesize());
> > > +	if (num_pages * getpagesize() < bufsizemin)
> > > +		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
> > > +
> > >   	/*
> > >   	 * Determine the fd for the 'buffers' BPF map.
> > >   	 */
> > >   	idp = dt_dlib_get_map(dtp, "buffers");
> > >   	if (idp == NULL || idp->di_id == DT_IDENT_UNDEF)
> > > -		return -ENOENT;
> > > +		return dt_set_errno(dtp, EDT_NOMEM);    // FIXME we used to do something more akin to ENOENT
> > >   	mapfd = idp->di_id;
> > > @@ -180,7 +179,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > >   	 */
> > >   	dtp->dt_pebset = dt_zalloc(dtp, sizeof(dt_pebset_t));
> > >   	if (dtp->dt_pebset == NULL)
> > > -		return -ENOMEM;
> > > +		return dt_set_errno(dtp, EDT_NOMEM);
> > >   	/*
> > >   	 * Allocate the per-CPU perf event buffers.
> > > @@ -189,7 +188,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > >   			 sizeof(struct dt_peb));
> > >   	if (pebs == NULL) {
> > >   		dt_free(dtp, dtp->dt_pebset);
> > > -		return -ENOMEM;
> > > +		return dt_set_errno(dtp, EDT_NOMEM);
> > >   	}
> > >   	dtp->dt_pebset->pebs = pebs;
> > > @@ -241,5 +240,5 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
> > >   fail:
> > >   	dt_pebs_exit(dtp);
> > > -	return -1;
> > > +	return dt_set_errno(dtp, EDT_NOMEM);  // FIXME need something better
> > >   }
> > > diff --git a/libdtrace/dt_peb.h b/libdtrace/dt_peb.h
> > > index e0f408f2..9ad23252 100644
> > > --- a/libdtrace/dt_peb.h
> > > +++ b/libdtrace/dt_peb.h
> > > @@ -43,7 +43,7 @@ typedef struct dt_pebset {
> > >   } dt_pebset_t;
> > >   extern void dt_pebs_exit(dtrace_hdl_t *);
> > > -extern int dt_pebs_init(dtrace_hdl_t *, size_t);
> > > +extern int dt_pebs_init(dtrace_hdl_t *, size_t, size_t);
> > >   #ifdef	__cplusplus
> > >   }
> > > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > > index 69a86358..7a0eb1da 100644
> > > --- a/libdtrace/dt_work.c
> > > +++ b/libdtrace/dt_work.c
> > > @@ -267,18 +267,21 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
> > >   		return dt_set_errno(dtp, errno);
> > >   	/*
> > > -	 * We need enough space for the pref_event_header, a 32-bit size, a
> > > +	 * We need enough space for the perf_event_header, a 32-bit size, a
> > >   	 * 4-byte gap, and the largest trace data record we may be writing to
> > >   	 * the buffer.  In other words, the buffer needs to be large enough to
> > >   	 * hold at least one perf-encapsulated trace data record.
> > > +	 *
> > > +	 * While dt_pebs_init() rounds the requested size up, size==0 is a
> > > +	 * special case.
> > >   	 */
> > >   	dtrace_getopt(dtp, "bufsize", &size);
> > > -	if (size == 0 ||
> > > -	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
> > > -		   dtp->dt_maxreclen)
> > > +	if (size == 0)
> > >   		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
> > > -	if (dt_pebs_init(dtp, size) == -1)
> > > -		return dt_set_errno(dtp, EDT_NOMEM);
> > > +	if (dt_pebs_init(dtp, size,
> > > +			 sizeof(struct perf_event_header) + sizeof(uint32_t)
> > > +			 + 4 + dtp->dt_maxreclen) == -1)
> > > +		return -1;
> > >   	/*
> > >   	 * We must initialize the aggregation consumer handling before we
> > > diff --git a/test/unittest/options/err.b-too-low.d b/test/unittest/options/err.b-too-low.d
> > > index bb77e37c..f62155dd 100644
> > > --- a/test/unittest/options/err.b-too-low.d
> > > +++ b/test/unittest/options/err.b-too-low.d
> > > @@ -1,6 +1,6 @@
> > >   /*
> > >    * Oracle Linux DTrace.
> > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> > >    * Licensed under the Universal Permissive License v 1.0 as shown at
> > >    * http://oss.oracle.com/licenses/upl.
> > >    */
> > > @@ -12,19 +12,21 @@
> > >    */
> > >   /*
> > > - * We use a buffer size of 59 because that should be just too small to hold the
> > > - * trace records generated in this script:
> > > - *	- perf_event_header (40 bytes)
> > > - *	- size (4 bytes)
> > > - *	- gap (4 bytes)
> > > - *	- EPID (4 bytes)
> > > - *	- tag (4 bytes)
> > > - *	- exit value (4 bytes)
> > > + * We need over 4k bytes for the 4 string trace records generated in this script
> > > + * plus some meta data.
> > > + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> > > + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
> > >    */
> > > -/* @@runtest-opts: -b59 */
> > > +/* @@runtest-opts: -b4096 */
> > > +
> > > +#pragma D option strsize=1024
> > >   BEGIN
> > >   {
> > > +	trace("abc");
> > > +	trace("def");
> > > +	trace("ghi");
> > > +	trace("jkl");
> > >   	exit(0);
> > >   }
> > > diff --git a/test/unittest/options/err.bufsize-too-low.d b/test/unittest/options/err.bufsize-too-low.d
> > > index bbbdb5c5..25efdf72 100644
> > > --- a/test/unittest/options/err.bufsize-too-low.d
> > > +++ b/test/unittest/options/err.bufsize-too-low.d
> > > @@ -1,6 +1,6 @@
> > >   /*
> > >    * Oracle Linux DTrace.
> > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> > >    * Licensed under the Universal Permissive License v 1.0 as shown at
> > >    * http://oss.oracle.com/licenses/upl.
> > >    */
> > > @@ -12,19 +12,21 @@
> > >    */
> > >   /*
> > > - * We use a buffer size of 59 because that should be just too small to hold the
> > > - * trace records generated in this script:
> > > - *	- perf_event_header (40 bytes)
> > > - *	- size (4 bytes)
> > > - *	- gap (4 bytes)
> > > - *	- EPID (4 bytes)
> > > - *	- tag (4 bytes)
> > > - *	- exit value (4 bytes)
> > > + * We need over 4k bytes for the 4 string trace records generated in this script
> > > + * plus some meta data.
> > > + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> > > + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
> > >    */
> > > -/* @@runtest-opts: -xbufsize=59 */
> > > +/* @@runtest-opts: -xbufsize=4096 */
> > > +
> > > +#pragma D option strsize=1024
> > >   BEGIN
> > >   {
> > > +	trace("abc");
> > > +	trace("def");
> > > +	trace("ghi");
> > > +	trace("jkl");
> > >   	exit(0);
> > >   }
> > > diff --git a/test/unittest/options/tst.b.d b/test/unittest/options/tst.b.d
> > > index 57fa030d..3bf08edc 100644
> > > --- a/test/unittest/options/tst.b.d
> > > +++ b/test/unittest/options/tst.b.d
> > > @@ -1,6 +1,6 @@
> > >   /*
> > >    * Oracle Linux DTrace.
> > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> > >    * Licensed under the Universal Permissive License v 1.0 as shown at
> > >    * http://oss.oracle.com/licenses/upl.
> > >    */
> > > @@ -12,19 +12,21 @@
> > >    */
> > >   /*
> > > - * We use a buffer size of 60 because that should be the exact size necessary
> > > - * to hold the trace records generated in this script:
> > > - *	- perf_event_header (40 bytes)
> > > - *	- size (4 bytes)
> > > - *	- gap (4 bytes)
> > > - *	- EPID (4 bytes)
> > > - *	- tag (4 bytes)
> > > - *	- exit value (4 bytes)
> > > + * We need over 4k bytes for the 4 string trace records generated in this script
> > > + * plus some meta data.
> > > + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> > > + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
> > >    */
> > > -/* @@runtest-opts: -b60 */
> > > +/* @@runtest-opts: -b4097 */
> > > +
> > > +#pragma D option strsize=1024
> > >   BEGIN
> > >   {
> > > +	trace("abc");
> > > +	trace("def");
> > > +	trace("ghi");
> > > +	trace("jkl");
> > >   	exit(0);
> > >   }
> > > diff --git a/test/unittest/options/tst.bufsize.d b/test/unittest/options/tst.bufsize.d
> > > index 96b0f1b8..23af81aa 100644
> > > --- a/test/unittest/options/tst.bufsize.d
> > > +++ b/test/unittest/options/tst.bufsize.d
> > > @@ -1,6 +1,6 @@
> > >   /*
> > >    * Oracle Linux DTrace.
> > > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> > >    * Licensed under the Universal Permissive License v 1.0 as shown at
> > >    * http://oss.oracle.com/licenses/upl.
> > >    */
> > > @@ -12,19 +12,21 @@
> > >    */
> > >   /*
> > > - * We use a buffer size of 60 because that should be the exact size necessary
> > > - * to hold the trace records generated in this script:
> > > - *	- perf_event_header (40 bytes)
> > > - *	- size (4 bytes)
> > > - *	- gap (4 bytes)
> > > - *	- EPID (4 bytes)
> > > - *	- tag (4 bytes)
> > > - *	- exit value (4 bytes)
> > > + * We need over 4k bytes for the 4 string trace records generated in this script
> > > + * plus some meta data.
> > > + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
> > > + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
> > >    */
> > > -/* @@runtest-opts: -xbufsize=60 */
> > > +/* @@runtest-opts: -xbufsize=4097 */
> > > +
> > > +#pragma D option strsize=1024
> > >   BEGIN
> > >   {
> > > +	trace("abc");
> > > +	trace("def");
> > > +	trace("ghi");
> > > +	trace("jkl");
> > >   	exit(0);
> > >   }
> > > -- 
> > > 2.18.4
> > > 
